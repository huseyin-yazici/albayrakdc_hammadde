import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
part 'acceptance_control_event.dart';
part 'acceptance_control_state.dart';

class AcceptanceControlBloc
    extends Bloc<AcceptanceControlEvent, AcceptanceControlState> {
  // AcceptanceControlBloc sınıfı AcceptanceControlEvent olaylarını kabul eder ve AcceptanceControlState durumlarını yönetir.
  final textRecognizer = GoogleMlKit.vision
      .textRecognizer(); // Google ML Kit'in metin tanıma özelliğini kullanmak için bir textRecognizer nesnesi oluşturuyoruz.

  AcceptanceControlBloc() : super(AcceptanceControlInitial()) {
    // AcceptanceControlBloc yapıcısı, başlangıç durumunu AcceptanceControlInitial olarak ayarlar.
    on<RecognizeTextFromCameraEvent>(
        _onRecognizeTextFromCamera); // RecognizeTextFromCameraEvent olayını dinler ve _onRecognizeTextFromCamera metodunu çağırır.
  }

  Future<void> _onRecognizeTextFromCamera(RecognizeTextFromCameraEvent event,
      Emitter<AcceptanceControlState> emit) async {
    // _onRecognizeTextFromCamera metodu, kameradan metin tanıma işlemi yapar.
    try {
      emit(AcceptanceControlLoading()); // Yükleniyor durumunu yayınlar.
      final inputImage =
          await _getInputImageFromCamera(); // Kameradan bir resim alır.
      final recognizedText = await textRecognizer
          .processImage(inputImage); // Resimdeki metni tanır.
      final extractedData = _filterRecognizedText(
          recognizedText); // Tanınan metni filtreler ve gerekli verileri çıkarır.
      emit(AcceptanceControlSuccess(
          extractedData:
              extractedData)); // Başarılı durumunu ve çıkarılan verileri yayınlar.
    } catch (e) {
      emit(AcceptanceControlFailure(
          error:
              'Error recognizing text from camera: $e')); // Hata durumunu ve hata mesajını yayınlar.
    }
  }

  Future<InputImage> _getInputImageFromCamera() async {
    // Kameradan resim almak için kullanılan metot.
    final picker = ImagePicker(); // ImagePicker nesnesini oluşturuyoruz.
    final pickedFile = await picker.pickImage(
        source: ImageSource
            .camera); // Kullanıcının kameradan bir resim çekmesini sağlıyoruz.
    if (pickedFile != null) {
      // Eğer resim seçildiyse,
      final file = File(pickedFile.path); // Resmin dosya yolunu alıyoruz.
      final inputImage = InputImage.fromFilePath(
          file.path); // Dosya yolundan bir InputImage nesnesi oluşturuyoruz.
      return inputImage; // InputImage nesnesini döndürüyoruz.
    } else {
      throw Exception(
          'No image selected from camera'); // Eğer resim seçilmediyse, bir hata fırlatıyoruz.
    }
  }

  Map<String, String> _filterRecognizedText(RecognizedText recognizedText) {
    // Tanınan metni filtreleyen metot.
    final Map<String, String> extractedData = {
      // Filtrelenmiş verileri saklamak için bir harita oluşturuyoruz.
      'EBAT': '',
      'KALITE': '',
      'DOKUM': '',
      'AGIRLIK': '',
      'PAKET': ''
    };

    for (var block in recognizedText.blocks) {
      // Her metin bloğunu döngü ile geziyoruz.
      for (var line in block.lines) {
        // Her bloğun içindeki satırları döngü ile geziyoruz.
        final text = line.text; // Her satırdaki metni alıyoruz.

        if (text.contains('Ø')) {
          // Eğer metin "Ø" içeriyorsa,
          extractedData['EBAT'] = text; // EBAT anahtarına bu metni ekliyoruz.
        } else if (text.contains('SAE')) {
          // Eğer metin "SAE" içeriyorsa,
          extractedData['KALITE'] =
              text; // KALITE anahtarına bu metni ekliyoruz.
        } else if (RegExp(r'^\d{6}$').hasMatch(text)) {
          // Eğer metin 6 haneli bir sayı ise,
          extractedData['DOKUM'] = text; // DOKUM anahtarına bu metni ekliyoruz.
        } else if (RegExp(r'^\d+$').hasMatch(text) && text.length == 4) {
          // Eğer metin 4 haneli bir sayı ise,
          extractedData['AGIRLIK'] =
              text; // AGIRLIK anahtarına bu metni ekliyoruz.
        } else if (RegExp(r'^\d{8}$').hasMatch(text)) {
          // Eğer metin 8 haneli bir sayı ise,
          extractedData['PAKET'] = text; // PAKET anahtarına bu metni ekliyoruz.
        }
      }
    }

    return extractedData; // Filtrelenmiş verileri döndürüyoruz.
  }

  @override
  Future<void> close() {
    // BLoC sınıfının kapatma metodu.
    textRecognizer.close(); // textRecognizer nesnesini kapatıyoruz.
    return super.close(); // Üst sınıfın close metodunu çağırıyoruz.
  }
}
