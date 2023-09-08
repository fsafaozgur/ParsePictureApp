# ParsePictureApp Uygulaması

## Giriş
Proje kapsamında; ParseSwift kütüphaneleri, back4app servis sağlayıcısı üzerinde kullanılarak bir fotoğraf paylaşım uygulaması tasarlanmıştır. 

## Hedef
Proje ile birlikte; ParseSwift kütüphaneleri kullanılarak kullanıcı kayıt, kullanıcı girişi, fotoğraf ve yorumdan oluşan kullanıcı iletilerinin web tabanlı kayıt edilmesi ve kullanıcıya bir arayüz ile sunulması işlemlerinin nasıl tasarlanacağının ortaya konulması amaçlanmıştır. 

## Uygulama Kullanımı
Uygulama ilk olarak ParseSwift ile kullanıcı kaydı ve giriş işlemi ile başlamakta, uygulama içerisinden çıkış yapılmadığı sürece kullanıcı oturumu açık tutulmaktadır.

Giriş yapan kullanıcı, Upload bölümünden resim yükleyebilmekte, bu resim ve resmi kaydederken kullanıcının resim için yapmış olduğu yorum ile birlikte tüm bilgiler back4app tarafından sağlanan veritabanına kaydedilmektedir.

Kaydedilen fotoğraf ile bu fotoğrafa ait paylaşan bilgisi ve fotoğraf yorumu Feed sayfasında görüntülenebilmektedir. 
