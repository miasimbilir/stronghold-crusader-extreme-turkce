# 🏰 Stronghold Crusader Extreme — Türkçe Yama

**Stronghold Crusader Extreme** oyununu, oyunun ruhuna uygun **destansı/arkaik bir Türkçe** ile çeviren resmî olmayan, **ücretsiz** bir hayran yamasıdır. Türkçe karakter sorunu (ş, ğ, ı, İ) da çözülmüştür.

> Bu yama oyunun **tüm metnini** kapsar: menüler, kampanyalar, görev brifingleri, yapay zekâ lord konuşmaları, harita açıklamaları, bina/birim panelleri ve **oyun içi yardım ansiklopedisinin tamamı**.

---

## ✨ Neler Çevrildi?

- ✅ **Türkçe karakter düzeltmesi** — ş, ğ, ı, İ artık doğru görünüyor (font, donör-glif yöntemiyle yamalandı)
- ✅ Tüm **menüler ve arayüz** (yapı panelleri, seçenekler, pazar, skor ekranları)
- ✅ **Tarihî kampanyalar** ve iktisat kampanyası (brifingler, hedefler, ipuçları)
- ✅ **20 askerî görev** + Crusader Yolu seviye adları
- ✅ **16 yapay zekâ lordunun** tüm konuşmaları ve karakter açıklamaları (Sıçan, Yılan, Selâhaddin, Aslan Yürek…)
- ✅ ~85 **Crusader harita adı ve açıklaması**
- ✅ Tüm **mesajlar**, köylü konuşmaları, hakaretler, öğretici
- ✅ **Oyun içi yardım ansiklopedisinin tamamı** ("?" düğmesi — 143 bölüm: binalar, birimler, kavramlar)

**Çeviri kararları:** "Crusader" oyun/marka adı olarak korundu, "Haçlı" ise tarihî/fraksiyon anlamında kullanıldı. Tarihî yer adlarında Türkçe karşılıklar tercih edildi (İznik, Antakya, Kudüs, Halep, Urfa, Trablus…). Köylü ad-soyadları İngilizce bırakıldı.

---

## 📥 Kurulum (Otomatik — Önerilen)

1. Sağdaki **Releases** bölümünden en son **`.zip`** dosyasını indir.
2. ZIP'i **tamamen** bir klasöre çıkar (içinden çalıştırma!).
3. **`Kur.bat`** dosyasına çift tıkla.
   - Betik oyunu Steam'de otomatik bulur, orijinal dosyaları yedekler ve yamayı kurar.
   - Oyun otomatik bulunamazsa, sana oyunun klasörünü soracaktır.
4. Bitti! Oyunu başlat. 🎉

> 🛡️ Kurulum, orijinal dosyalarını oyun klasöründeki **`_TR_Yedek`** klasörüne yedekler. Hiçbir şey kaybolmaz.

### Manuel Kurulum

`dosyalar` klasörünün içindekileri oyunun ana klasörüne (`...\steamapps\common\Stronghold Crusader Extreme`) kopyalayıp birleştir/üzerine yaz:

| Dosya | Hedef |
|---|---|
| `cr.tex` | oyun ana klasörü |
| `gm\font_stronghold_aa.gm1` | `gm\` klasörü |
| `help\crusader_help.hlp` | `help\` klasörü |
| `help\crusader_extreme_help.hlp` | `help\` klasörü |

*(Manuel kurulumda önce bu 4 dosyanın yedeğini kendin almanı tavsiye ederiz.)*

---

## 🗑️ Kaldırma

**`Kaldir.bat`** dosyasına çift tıkla — orijinal İngilizce dosyalar `_TR_Yedek` klasöründen geri yüklenir.

Alternatif: Steam → oyuna sağ tık → **Özellikler → Yüklü Dosyalar → Oyun dosyalarının bütünlüğünü doğrula**.

---

## ❓ Sık Sorulanlar

**Steam güncellemesi/doğrulaması yamayı siler mi?**
Evet. Steam "oyun dosyalarının bütünlüğünü doğrula" çalıştırırsan ya da oyun güncellenirse dosyalar İngilizceye döner. Sorun değil — `Kur.bat`'i tekrar çalıştır.

**Çok oyunculuda sorun çıkarır mı?**
Yama yalnızca metin/font dosyalarını değiştirir, oyun mantığına dokunmaz. Yine de çevrimiçi oynarken karşı taraf İngilizce sürümdeyse bazı yama adları senkron uyarısı verebilir; emin değilsen çok oyunculu öncesi kaldırabilirsin.

**Hangi sürümlerle uyumlu?**
Steam'deki **Stronghold Crusader Extreme** ile test edildi. Diğer sürümlerde dosya yapısı farklı olabilir.

---

## 🔧 Teknik Notlar

- `cr.tex`: oyunun tüm arayüz/kampanya metnini tutan UTF-16 dosyası (260 girişlik bölüm-offset tablosu çözüldü, byte-tam yeniden inşa).
- **Türkçe karakter çözümü:** Oyun metni font aramasından önce CP1252'ye çeviriyor; ç ö ü çalışıyor ama ş ğ ı İ taban harfe düşüyor. Çözüm: `font_stronghold_aa.gm1` içindeki, Türkçede kullanılmayan İzlandaca glifler (þ ð ý Þ Ð Ý) Türkçe harf şekillerine yeniden boyandı ve kodlama sırasında ş→þ, ğ→ý, ı→ð (vb.) ikamesi yapıldı. (5 font yüzünün hepsi düzenlendi.)
- **Yardım ansiklopedisi:** `help\*.hlp` dosyaları ayrı bir UTF-16 işaretleme formatındadır; aynı font/donör yöntemiyle çevrildi, çapraz bağlantılar korundu.

---

## ⚖️ Yasal Uyarı

Bu, **resmî olmayan bir hayran çevirisidir**. Firefly Studios ile bir ilişkisi yoktur ve onlar tarafından desteklenmez. Yamayı kullanmak için oyunun **yasal bir kopyasına sahip olmanız** gerekir. İçerdiği oyun dosyaları yalnızca çeviriyi iletmek için değiştirilmiştir; tüm oyun içeriğinin hakları **Firefly Studios**'a aittir. Yama ücretsizdir ve satılamaz.

---

## 🙏 Teşekkür

Çeviri ve teknik çözümler topluluk için hazırlanmıştır. Oyunun kendisi için **Firefly Studios**'a teşekkürler.

Hata bildirimi, taşan metin veya öneri için **Issues** bölümünü kullanabilirsiniz. İyi oyunlar, Lordum! ⚔️
