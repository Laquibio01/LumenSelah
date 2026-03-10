import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BibleReaderScreen extends StatefulWidget {
  const BibleReaderScreen({Key? key}) : super(key: key);

  @override
  State<BibleReaderScreen> createState() => _BibleReaderScreenState();
}

class _BibleReaderScreenState extends State<BibleReaderScreen> {
  // Colores extraídos del mockup (Pantalla Reader)
  static const Color bgColor = Color(0xFFF9F6EE); // Fondo crema claro
  static const Color textColor = Color(0xFF2E2E2E); // Gris muy oscuro/Negro
  static const Color accentColor = Color(0xFFECA646); // Naranja del marcador

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: textColor, size: 20),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        centerTitle: true,
        title: Text(
          'Reader',
          style: GoogleFonts.montserrat(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: textColor.withOpacity(0.1),
            height: 1.0,
          ),
        ),
      ),
      body: _buildReaderBody(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildReaderBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Genesis 1:1',
            style: GoogleFonts.montserrat(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: textColor,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 24),
          _buildParagraph(
            '1 Lorem ipsum dolor sit amet, consectetur adipiscing elit, and sourbrondon water man: med the soul threms an a frivsee thon howser of the slow althswi the light in the saundiment, and the woon he ways of two wors.',
          ),
          const SizedBox(height: 20),
          _buildParagraph(
            '2 And the wolkwith withers the sont of light cansprato his emen and leamout the pvaverous thore slass, the whos srewfe srure their onto: rnto Jesus.',
          ),
          const SizedBox(height: 20),
          _buildParagraph(
            '4 And the siahmdfait the world the noft nond, they reduces the reions and memoot the vicerdivos in the Earth, the chlewnade wittheat to the laom.',
          ),
          const SizedBox(height: 20),
          _buildParagraph(
            '5 Concurrent as his sider and conservators was the licener sin or something similar to fill the empty space in this mockup.',
          ),
        ],
      ),
    );
  }

  Widget _buildParagraph(String text) {
    // Implementación para destacar el número del versículo inline (el primer carácter numérico)
    final match = RegExp(r'^(\d+)\s+(.*)$').firstMatch(text);
    
    if (match != null) {
      final number = match.group(1)!;
      final rest = match.group(2)!;
      
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: number + ' ',
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
                height: 1.6,
              ),
            ),
            TextSpan(
              text: rest,
              style: GoogleFonts.merriweather(
                fontSize: 18,
                color: textColor,
                height: 1.6,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      );
    }

    return Text(
      text,
      style: GoogleFonts.merriweather(
        fontSize: 18,
        color: textColor,
        height: 1.6,
        letterSpacing: 0.2,
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -2),
            blurRadius: 10,
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.home_outlined),
                color: textColor.withOpacity(0.6),
                iconSize: 28,
                onPressed: () {
                  Navigator.of(context).maybePop();
                },
              ),
              IconButton(
                icon: const Icon(Icons.search),
                color: textColor.withOpacity(0.6),
                iconSize: 28,
                onPressed: () {},
              ),
              // Botón central destacado (Bookmark)
              Container(
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: const Icon(Icons.bookmark),
                  color: Colors.white,
                  iconSize: 24,
                  onPressed: () {},
                ),
              ),
              IconButton(
                icon: const Icon(Icons.menu),
                color: textColor.withOpacity(0.6),
                iconSize: 28,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
