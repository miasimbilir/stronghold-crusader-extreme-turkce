# 📋 Proje Tamamlanma Raporu
## Stronghold Crusader Extreme — Türkçe Yama

**Durum:** ✅ Tamamlandı
**Hedef:** Oyunu, ruhuna uygun destansı/arkaik Türkçeye çevirmek + Türkçe karakter sorununu çözmek.

---

## 1. Özet

Stronghold Crusader Extreme'in **tüm oyuncu-yüzü metni** Türkçeye çevrildi ve oyunun ş/ğ/ı/İ karakterlerini gösterememe sorunu kalıcı olarak çözüldü. Yama, oyunun yalnızca **4 dosyasını** değiştirir ve geri alınabilir.

---

## 2. Sayısal Sonuçlar

| Bileşen | Sonuç |
|---|---|
| **Ana metin (cr.tex)** | 3.618 / 4.091 dolu metin kutusu Türkçe (**~%88**) |
| **Yardım ansiklopedisi (.hlp)** | 143 bölüm / 495 metin parçası — oyuncu-yüzü içeriğin tamamı |
| **Yapay zekâ lordları** | 16 lordun tüm konuşma setleri + karakter açıklamaları |
| **Çevrilen harita açıklaması** | ~85 Crusader haritası |
| **Değiştirilen oyun dosyası** | 4 (cr.tex, font, 2× help) |

**Çevrilmeyen ~%12'lik kısım kasıtlıdır:** köylü ad-soyadları (Avrupai karakterler, İngilizce bırakıldı), oyunda hiç görünmeyen geliştirici etiketleri, ve Türkçede aynı kalan marka/özel adlar (Stronghold Crusader, Frederick vb.) ile telif satırları.

---

## 3. Çözülen Teknik Sorunlar

### 3.1 Metin formatı (cr.tex)
Oyunun tüm arayüz ve kampanya metni, **UTF-16** kodlu, başında **260 girişlik bir bölüm-offset tablosu** bulunan `cr.tex` dosyasında. Format tersine mühendislikle çözüldü; dosya, çeviri sonrası byte-tam olarak yeniden inşa edilebiliyor.

### 3.2 Türkçe karakter sorunu (asıl zorluk)
- **Teşhis:** Oyun, metni font aramasından önce **CP1252**'ye çeviriyor. ç ö ü Ç Ö Ü bu kümede var (çalışıyor); ş ğ ı İ Ş Ğ yok (taban harfe düşüyor: ı→i, ş→s…).
- **Çözüm — donör-glif yöntemi:** Fontta (`font_stronghold_aa.gm1`) Türkçede kullanılmayan İzlandaca glifler (þ ð ý Þ Ð Ý) tespit edildi; bunların bitmap görselleri Türkçe harf şekillerine (ş ğ ı Ş Ğ İ) yeniden boyandı. Kodlama sırasında ş→þ, ğ→ý, ı→ð, İ→Ð, Ş→Þ, Ğ→Ý ikamesi yapılıyor. Böylece CP1252 dönüşümünden sağ çıkan harfler, fontta artık doğru şekli gösteriyor.
- **Önemli ayrıntı:** Font 5 ayrı boyut yüzü içeriyor; çözümün çalışması için **beşinin de** düzenlenmesi gerekti.

### 3.3 Yardım ansiklopedisi (.hlp)
Oyun içi "?" yardımının ayrı dosyalarda (`help\crusader_help.hlp`) olduğu keşfedildi. Bunlar özel işaretlemeli UTF-16 dosyaları (143 bölüm). Aynı font/donör yöntemiyle çevrildi; renkli **çapraz bağlantılar** (ör. "yiyecek" → yiyecek sayfası) korundu.

---

## 4. Çeviri İlkeleri

- **Üslup:** Destansı/arkaik Türkçe; çeşitli hitaplar (Lordum, Hünkârım, Efendim).
- **"Crusader"** → marka/oyun adı olarak korundu (Crusader Yolu, Crusader Oyunu).
- **"Haçlı"** → tarihî/fraksiyon anlamında (Haçlı Devletleri, Haçlı kralları).
- **Önemli terimler:** İç Kale, Müstahkem Kale, İtibar (Popularity), Korku Etkeni, Mızrakçı, Kargıcı, Gürzcü, Kılıç Eri, Arbaletçi, Şövalye, Selâhaddin, Sarazen.
- **Hayvan-lord lakapları (her yerde tutarlı):** Sıçan, Yılan, Domuz, Kurt.
- **Tarihî yer adları:** İznik, Ereğli, Antakya, Kudüs, Şam, Halep, Urfa, Trablus, Tir, Kıbrıs…
- **Köylü ad-soyadları:** İngilizce bırakıldı (Avrupai karakterler).

---

## 5. Yama İçeriği (Değiştirilen Dosyalar)

| Dosya | Açıklama |
|---|---|
| `cr.tex` | Tüm arayüz + kampanya + lord metinleri |
| `gm\font_stronghold_aa.gm1` | Türkçe karakterler için yamalı font |
| `help\crusader_help.hlp` | Oyun içi yardım ansiklopedisi (asıl kullanılan) |
| `help\crusader_extreme_help.hlp` | Yardım ansiklopedisi (Extreme sürümü) |

---

## 6. Kalan / İsteğe Bağlı İşler

- Geniş oyun içi **taşma (overflow) kontrolü**: Türkçe metin İngilizceden uzun olduğunda dar arayüz kutularında nadiren kesilme olabilir; oynanışta görülürse ilgili metin kısaltılarak düzeltilebilir.
- Topluluk geri bildirimiyle terim/ifade ince ayarı.

---

## 7. Hazırlanış

Bu yama yapay zekâ ile hazırlanmıştır (Claude Code).

---

*Bu rapor yamanın teknik özetidir. Kurulum için `README.md` dosyasına bakınız.*
