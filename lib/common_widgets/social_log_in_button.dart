import 'package:flutter/material.dart';

//stateless widget yapıyoruz çünkü herhangi bir ver işleme durumu yok sadece bir görüntü
class SocialLoginButton extends StatelessWidget {
  //Bu widgeti gelecek isteklere göre kişiselleştirmemiz gerekiyor. Burada kişiselleştirmek istediğimiz alanlar neler onları sormamız gerekiyor.
  //Bütün alanları final veriyoruz öünkü bu bir stless widget ve yarın buna atadığımız değerler değişmeyece

  final String
      butonText; //ileride atayacağımız değerler değişmeyecek o yüzden final tanımlıyoruz
  final Color butonColor;
  final Color textColor;
  final double radius; //kenarların ovalliği
  final double yukseklik; //butonun yüksekliği
  final Widget
      butonIcon; //buranın en üst sınıfı Widget yaptık oyuzden icon ya da bir görüntü yollayabiliyoruz
  final VoidCallback onPressed;

  const SocialLoginButton(
      {@required this.butonText,
      this.butonColor: Colors.purple,
      this.textColor: Colors.white,
      this.radius:
          16, //herhang bir değer verilmezse radius 16 olarak kabul edilsin
      this.yukseklik: 40,
      this.butonIcon, //burada bir resim de olabilir bir icon da olabilir o yüzden bu ikisininde üst yapısı olan widget tanımlıyoruz

      @required this.onPressed})
      : assert(butonText != null, onPressed != null),
        super(); //butonun onpresi tipi voidcollback yapısı olan geriye bir değer döndürmeyen callback yapısı, onpress  birşey tıklandığında

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: SizedBox(
        height: yukseklik,
        child: RaisedButton(
            onPressed: onPressed,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Row(
              //row soldan sağa doğru elemanları diziyor
              mainAxisSize: MainAxisSize
                  .max, //burayı maz yaparsak bütün elemanlar soldan sağa doğru tüm alanı kaplar
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //spreads, Collection-if, Collection-For
                //Spreads olayı : burada ... koyduğumuzda eğer buton icon null değilse bu listenin içindekileri yap diyoruz. Birde zaten row bir liste alıyor
                if (butonIcon != null) ...[
                  butonIcon,
                  Text(
                    butonText,
                    style: TextStyle(color: textColor),
                  ),
                  Opacity(opacity: 0, child: butonIcon)
                ],

                if (butonIcon == null) ...[
                  Container(),
                  Text(
                    butonText,
                    style: TextStyle(color: textColor),
                  ),
                  Container(),
                ]
              ],
            ),
            color: butonColor),
      ),
    );
  }
}

//ESKİ YÖNTEM
/*
butonIcon != null ? butonIcon : Container(), //eğer icon kullanmak istemiyorsak hata olmasını önlemek için
              Text(
                butonText,
                style: TextStyle(color:textColor),
              ),
              butonIcon != null ? Opacity(opacity:0,child: butonIcon) : Container(), //burada sağ tarafa icon atıyoruz am görünmesin istiyoruz yazılar tam ortada çıkıyor böylece

 */
