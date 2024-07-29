import 'package:albayrakdc_hammadde/core/components/text/custom_text.dart';
import 'package:albayrakdc_hammadde/core/constans/app/color_constans.dart';
import 'package:flutter/material.dart';
import '../core/components/appbar/appbar.dart';

class AcceptanceControlPage extends StatelessWidget {
  const AcceptanceControlPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        isHome:false ,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight / 15,
            ),
            _buildTextFieldWithIcon(FieldLabel.diameter, Icons.straighten),
            _buildTextFieldWithIcon(FieldLabel.quality, Icons.grade),
            _buildTextFieldWithIcon(FieldLabel.coilNumber, Icons.confirmation_number),
            _buildTextFieldWithIcon(FieldLabel.castingNumber, Icons.format_list_numbered),
            _buildTextFieldWithIcon(FieldLabel.weight, Icons.local_grocery_store),
            _buildContainer(screenHeight, screenWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldWithIcon(FieldLabel fieldLabel, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: CustomText(
                fieldLabel.label,
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 7,
            child: TextFormField(
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: Icon(icon),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildContainer(double screenHeight, double screenWidth) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      height: screenHeight / 5,
      width: screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Icon(
                  color: ColorConstants.black,
                  Icons.camera_alt_outlined,
                  size: screenWidth * 0.15,
                ),
                onTap: () {
                  print('Kamera tıklandı');
                },
              ),
              const SizedBox(height: 8),
              CustomText(
                'Kamerayı Açmak için Tıklayınız',
                textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Icon(
                  color: ColorConstants.black,
                  Icons.qr_code_sharp,
                  size: screenWidth * 0.15,
                ),
                onTap: () {
                  print('QR tıklandı');
                },
              ),
              SizedBox(height: 8),
              CustomText(
                "QR'ı Açmak için Tıklayınız",
                textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum FieldLabel {
  diameter('Çap (mm)'),
  quality('Kalite'),
  coilNumber('Kangal No'),
  castingNumber('Döküm No'),
  weight('Ağırlık (kg)');

  final String label;

  const FieldLabel(this.label);
}
