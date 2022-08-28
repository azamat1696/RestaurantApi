@component('mail::message')
# Etkinlikler Uygulaması Geçici Şifreniz

Yeni şifreniz Oluşturulmuştur

@component('mail::button', ['url' => ''])
 {{$password}}
@endcomponent

Teşekkürler,<br>
@endcomponent
