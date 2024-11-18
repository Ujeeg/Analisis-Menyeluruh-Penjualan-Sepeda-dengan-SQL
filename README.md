# Analisis Menyeluruh Penjualan Sepeda dengan SQL

Pandemi COVID-19 yang dimulai pada akhir 2019 membawa perubahan signifikan dalam berbagai aspek kehidupan, termasuk pola konsumsi masyarakat. Salah satu dampak yang terlihat adalah meningkatnya minat terhadap sepeda sebagai sarana olahraga dan hobi. Dengan banyaknya kantor yang beralih dari sistem bekerja di kantor (WFO) ke bekerja dari rumah (WFH), masyarakat mendapatkan lebih banyak waktu untuk mengeksplorasi kegiatan outdoor, seperti bersepeda. Situasi ini, ditambah dengan adanya COVID-19, mendorong individu untuk mencari aktivitas fisik yang bisa dilakukan secara mandiri, memicu lonjakan permintaan sepeda dan aksesorisnya.

Dari perspektif bisnis, terjadinya pandemi seharusnya menciptakan peluang bagi industri sepeda untuk mengalami peningkatan penjualan. Namun, meskipun ada ekspektasi tersebut, data penjualan yang mencakup periode dari tahun 2017 hingga 2020 menunjukkan gambaran yang lebih kompleks. Penjualan memang meningkat pada awal pandemi, tetapi setelahnya, penurunan yang signifikan mulai terlihat. Maka diperlukan analisis penjualan untuk mengetahui problem dan mencari solusi agar penjualan dapat meningkat sesuai dengan tren yang terjadi pada saat pandemi COVID-19.

## Deskripsi Data

Data yang digunakan dalam analisis ini mencakup beberapa tabel yang terdiri dari informasi produk, reseller, karyawan, wilayah penjualan, dan catatan penjualan. Berikut adalah ringkasan tabel yang digunakan:

- **Tabel Product**: Menyimpan informasi terkait produk, termasuk nama, kategori, biaya produksi, warna, dan lainnya.
- **Tabel Region**: Berisi data wilayah penjualan seperti nama wilayah, negara, dan grup wilayah.
- **Tabel Reseller**: Menyimpan data reseller, termasuk jenis bisnis, kota, dan negara.
- **Tabel Sales Person**: Menyimpan informasi tentang karyawan yang menangani penjualan, seperti nama, jabatan, dan email.
- **Tabel Sales**: Berisi catatan transaksi penjualan, termasuk tanggal, produk, reseller, karyawan, wilayah, jumlah produk, harga satuan, total penjualan, dan biaya.
- **Tabel Sales Person Region**: Menghubungkan data karyawan dan wilayah yang mereka kelola.

## Bagaimana performa profit pada perusahaan ritel sepeda?

Selama 4 tahun terakhir, total profit yang didapat hanya mencapai 1.29%. Hal ini menunjukkan adanya masalah signifikan dalam profitabilitas penjualan produk sepeda dan aksesori.

Visualisasi total sales, total production cost, dan profit bulanan menunjukkan tren penjualan yang fluktuatif dengan penurunan profit yang signifikan pada pertengahan 2018, pertengahan 2019 (Juni-Agustus), dan mencapai puncak negatif pada Mei 2020. Sejak awal 2020, penjualan dan profit terus menurun, mencapai nilai negatif pada Mei 2020. Seharusnya dengan meningkatnya minat terhadap sepeda di awal tahun 2020 karena COVID-19, penjualan bisa menghasilkan profit cukup tinggi. Namun, dari visualisasi data Januari 2020 hingga Mei 2020, terlihat penurunan profit, menunjukkan masalah signifikan pada profitabilitas penjualan produk sepeda dan aksesoris.

Visualisasi di atas menunjukkan bahwa pada time series quantity penjualan dan profit, terjadi peningkatan jumlah penjualan dari Agustus 2020 hingga Oktober 2020. Namun, peningkatan ini diikuti oleh penurunan profit yang signifikan. Fenomena serupa juga terlihat pada satu bulan terakhir penjualan. Situasi ini mengindikasikan adanya kemungkinan penggunaan promosi yang tidak sesuai atau penjualan produk dengan profit negatif. Ketika promosi yang agresif diterapkan untuk meningkatkan penjualan, margin profit bisa tertekan sehingga meskipun volume penjualan meningkat, profit tidak mengikuti peningkatan tersebut. Selain itu, menjual produk di bawah biaya produksi untuk meningkatkan volume penjualan dapat menyebabkan kerugian finansial yang signifikan.

## Bagaimana performa penjualan ritel sepeda di tiap negaranya?

Germany dan Australia menjadi negara penyumbang profit negatif, sedangkan United States menjadi negara dengan profit tertinggi, disusul oleh Canada. Visualisasi menunjukkan penurunan profit yang sejalan dengan total profit keseluruhan.

United States dan Canada sangat berpengaruh dalam penjualan, karena telah menjadi negara reseller sejak tahun 2017. Sebaliknya, United Kingdom dan France baru memulai pada tahun 2018, sementara Germany dan Australia baru bergabung sebagai reseller pada tahun 2019. Hal ini dapat menjelaskan mengapa Germany dan Australia memiliki profit negatif, karena operasional mereka baru berjalan kurang dari satu tahun.

## Bagaimana performa penjualan tiap reseller di perusahaan ritel sepeda?

Terdapat 324 reseller yang memiliki profit negatif dan 308 reseller yang memiliki profit positif. Dengan hasil tersebut, dapat dikatakan bahwa performa reseller secara keseluruhan sangat buruk, dengan 51.3% reseller mencatatkan profit negatif dan hanya 48.7% yang positif. Kondisi ini mengindikasikan bahwa lebih dari setengah dari total reseller memiliki kinerja yang tidak memadai.

## Bagaimana performa penjualan tiap sales person di perusahaan ritel sepeda?

Tabel perbandingan total sales dan target sales selama 4 tahun menunjukkan bahwa semua karyawan memiliki penjualan yang belum mencapai target yang telah ditetapkan. Ada beberapa kemungkinan penyebabnya, seperti target yang mungkin terlalu tinggi, faktor eksternal yang mempengaruhi penjualan, dan perlunya pelatihan tambahan atau dukungan untuk tim penjualan.

Data menunjukkan bahwa total penjualan (Total Sales) umumnya lebih rendah daripada target penjualan (Target Sales) sepanjang periode yang dianalisis, mengindikasikan adanya kesenjangan signifikan antara realisasi penjualan dan target yang ditetapkan.

Terlihat adanya fluktuasi yang signifikan pada target penjualan dari bulan ke bulan. Ini dapat mencerminkan perubahan strategi perusahaan atau respons terhadap dinamika pasar. Misalnya, target pada bulan November 2017 ini lebih tinggi dibandingkan dengan bulan sebelumnya. Maka perlu adanya evaluasi terhadap strategi penjualan dan pemasaran di tim sales.

## Bagaimana performa penjualan produk?

Pada tabel di atas didapat bahwa ada beberapa barang yang memiliki total profit dan profit margin negatif. Maka perlu dianalisis lebih dalam lagi untuk melihat apakah rendahnya profit perusahaan disebabkan oleh harga jual yang lebih rendah dibandingkan harga produksi.

Dari pie chart yang berjudul "Distribution of Positive and Negative Product," kita dapat melihat bahwa 66.5% dari produk termasuk dalam kategori "positif," sementara 33.5% termasuk dalam kategori "negatif." Meski proporsi "negatif" lebih kecil, ada 33.5% produk yang mungkin memerlukan perbaikan atau peninjauan ulang pada harga jual atau penggunaan promosi. Fokus pada perbaikan produk ini dapat meningkatkan kepuasan pelanggan dan peningkatan profit perusahaan.

Dari product_category didapat satu kategori dengan profit negatif yaitu "Bikes," dimana total penjualan terbesar ada di kategori tersebut. Berdasarkan data tersebut, dapat disimpulkan bahwa penjualan kategori Bikes dengan total penjualan paling tinggi mengalami profit yang negatif. Hal ini mengindikasikan adanya masalah dalam strategi penjualan atau penetapan harga. Pada insight sebelumnya, dinyatakan bahwa lebih dari 50% produk dijual dengan profit negatif, yang memperkuat indikasi adanya masalah dalam harga jual atau efisiensi biaya produksi.

Berdasarkan data pada tabel di atas, terdapat beberapa insight yang berhubungan dengan penjelasan sebelumnya mengenai kategori "Bikes" yang memiliki profit negatif meskipun total penjualannya terbesar. Pertama, penjualan subkategori seperti Road Bikes dan Touring Bikes menunjukkan total penjualan sebesar 28,681,989.48 dan 9,506,980.82, namun keduanya mengalami kerugian masing-masing sebesar -1,051,786.18 dan -945,090.58 dengan profit margin -3.67% dan -9.94%. Hal ini memperkuat indikasi bahwa terdapat masalah dalam strategi penjualan atau penetapan harga pada subkategori Bikes. Dibandingkan dengan subkategori lainnya, seperti Jerseys dalam kategori Clothing yang juga mengalami kerugian dengan profit margin -21.47% namun dengan total penjualan yang lebih kecil, dan Accessories seperti Tires and Tubes yang menunjukkan profit margin positif sebesar 37.43%, subkategori Bikes jelas memerlukan perhatian lebih.

Potensi penyebab dari profit negatif ini termasuk biaya produksi yang tinggi serta harga jual yang mungkin tidak sesuai dengan nilai pasar. Oleh karena itu, evaluasi terhadap harga jual dan strategi pemasaran serta upaya pengurangan biaya produksi menjadi sangat penting untuk meningkatkan profitabilitas subkategori ini. Dengan analisis yang lebih mendalam dan perubahan strategis, diharapkan subkategori Bikes dapat beralih dari profit negatif menuju hasil yang lebih positif.

# Analisis Menyeluruh Penjualan Sepeda dengan SQL

Pandemi COVID-19 yang dimulai pada akhir 2019 membawa perubahan signifikan dalam berbagai aspek kehidupan, termasuk pola konsumsi masyarakat. Salah satu dampak yang terlihat adalah meningkatnya minat terhadap sepeda sebagai sarana olahraga dan hobi. Dengan banyaknya kantor yang beralih dari sistem bekerja di kantor (WFO) ke bekerja dari rumah (WFH), masyarakat mendapatkan lebih banyak waktu untuk mengeksplorasi kegiatan outdoor, seperti bersepeda. Situasi ini, ditambah dengan adanya COVID-19, mendorong individu untuk mencari aktivitas fisik yang bisa dilakukan secara mandiri, memicu lonjakan permintaan sepeda dan aksesorisnya.

Dari perspektif bisnis, terjadinya pandemi seharusnya menciptakan peluang bagi industri sepeda untuk mengalami peningkatan penjualan. Namun, meskipun ada ekspektasi tersebut, data penjualan yang mencakup periode dari tahun 2017 hingga 2020 menunjukkan gambaran yang lebih kompleks. Penjualan memang meningkat pada awal pandemi, tetapi setelahnya, penurunan yang signifikan mulai terlihat. Maka diperlukan analisis penjualan untuk mengetahui problem dan mencari solusi agar penjualan dapat meningkat sesuai dengan tren yang terjadi pada saat pandemi COVID-19.

## Deskripsi Data

Data yang digunakan dalam analisis ini mencakup beberapa tabel yang terdiri dari informasi produk, reseller, karyawan, wilayah penjualan, dan catatan penjualan. Berikut adalah ringkasan tabel yang digunakan:

- **Tabel Product**: Menyimpan informasi terkait produk, termasuk nama, kategori, biaya produksi, warna, dan lainnya.
- **Tabel Region**: Berisi data wilayah penjualan seperti nama wilayah, negara, dan grup wilayah.
- **Tabel Reseller**: Menyimpan data reseller, termasuk jenis bisnis, kota, dan negara.
- **Tabel Sales Person**: Menyimpan informasi tentang karyawan yang menangani penjualan, seperti nama, jabatan, dan email.
- **Tabel Sales**: Berisi catatan transaksi penjualan, termasuk tanggal, produk, reseller, karyawan, wilayah, jumlah produk, harga satuan, total penjualan, dan biaya.
- **Tabel Sales Person Region**: Menghubungkan data karyawan dan wilayah yang mereka kelola.

## Bagaimana performa profit pada perusahaan ritel sepeda?

Selama 4 tahun terakhir, total profit yang didapat hanya mencapai 1.29%. Hal ini menunjukkan adanya masalah signifikan dalam profitabilitas penjualan produk sepeda dan aksesori.

Visualisasi total sales, total production cost, dan profit bulanan menunjukkan tren penjualan yang fluktuatif dengan penurunan profit yang signifikan pada pertengahan 2018, pertengahan 2019 (Juni-Agustus), dan mencapai puncak negatif pada Mei 2020. Sejak awal 2020, penjualan dan profit terus menurun, mencapai nilai negatif pada Mei 2020. Seharusnya dengan meningkatnya minat terhadap sepeda di awal tahun 2020 karena COVID-19, penjualan bisa menghasilkan profit cukup tinggi. Namun, dari visualisasi data Januari 2020 hingga Mei 2020, terlihat penurunan profit, menunjukkan masalah signifikan pada profitabilitas penjualan produk sepeda dan aksesoris.

Visualisasi di atas menunjukkan bahwa pada time series quantity penjualan dan profit, terjadi peningkatan jumlah penjualan dari Agustus 2020 hingga Oktober 2020. Namun, peningkatan ini diikuti oleh penurunan profit yang signifikan. Fenomena serupa juga terlihat pada satu bulan terakhir penjualan. Situasi ini mengindikasikan adanya kemungkinan penggunaan promosi yang tidak sesuai atau penjualan produk dengan profit negatif. Ketika promosi yang agresif diterapkan untuk meningkatkan penjualan, margin profit bisa tertekan sehingga meskipun volume penjualan meningkat, profit tidak mengikuti peningkatan tersebut. Selain itu, menjual produk di bawah biaya produksi untuk meningkatkan volume penjualan dapat menyebabkan kerugian finansial yang signifikan.

## Bagaimana performa penjualan ritel sepeda di tiap negaranya?

Germany dan Australia menjadi negara penyumbang profit negatif, sedangkan United States menjadi negara dengan profit tertinggi, disusul oleh Canada. Visualisasi menunjukkan penurunan profit yang sejalan dengan total profit keseluruhan.

United States dan Canada sangat berpengaruh dalam penjualan, karena telah menjadi negara reseller sejak tahun 2017. Sebaliknya, United Kingdom dan France baru memulai pada tahun 2018, sementara Germany dan Australia baru bergabung sebagai reseller pada tahun 2019. Hal ini dapat menjelaskan mengapa Germany dan Australia memiliki profit negatif, karena operasional mereka baru berjalan kurang dari satu tahun.

## Bagaimana performa penjualan tiap reseller di perusahaan ritel sepeda?

Terdapat 324 reseller yang memiliki profit negatif dan 308 reseller yang memiliki profit positif. Dengan hasil tersebut, dapat dikatakan bahwa performa reseller secara keseluruhan sangat buruk, dengan 51.3% reseller mencatatkan profit negatif dan hanya 48.7% yang positif. Kondisi ini mengindikasikan bahwa lebih dari setengah dari total reseller memiliki kinerja yang tidak memadai.

## Bagaimana performa penjualan tiap sales person di perusahaan ritel sepeda?

Tabel perbandingan total sales dan target sales selama 4 tahun menunjukkan bahwa semua karyawan memiliki penjualan yang belum mencapai target yang telah ditetapkan. Ada beberapa kemungkinan penyebabnya, seperti target yang mungkin terlalu tinggi, faktor eksternal yang mempengaruhi penjualan, dan perlunya pelatihan tambahan atau dukungan untuk tim penjualan.

Data menunjukkan bahwa total penjualan (Total Sales) umumnya lebih rendah daripada target penjualan (Target Sales) sepanjang periode yang dianalisis, mengindikasikan adanya kesenjangan signifikan antara realisasi penjualan dan target yang ditetapkan.

Terlihat adanya fluktuasi yang signifikan pada target penjualan dari bulan ke bulan. Ini dapat mencerminkan perubahan strategi perusahaan atau respons terhadap dinamika pasar. Misalnya, target pada bulan November 2017 ini lebih tinggi dibandingkan dengan bulan sebelumnya. Maka perlu adanya evaluasi terhadap strategi penjualan dan pemasaran di tim sales.

## Bagaimana performa penjualan produk?

Pada tabel di atas didapat bahwa ada beberapa barang yang memiliki total profit dan profit margin negatif. Maka perlu dianalisis lebih dalam lagi untuk melihat apakah rendahnya profit perusahaan disebabkan oleh harga jual yang lebih rendah dibandingkan harga produksi.

Dari pie chart yang berjudul "Distribution of Positive and Negative Product," kita dapat melihat bahwa 66.5% dari produk termasuk dalam kategori "positif," sementara 33.5% termasuk dalam kategori "negatif." Meski proporsi "negatif" lebih kecil, ada 33.5% produk yang mungkin memerlukan perbaikan atau peninjauan ulang pada harga jual atau penggunaan promosi. Fokus pada perbaikan produk ini dapat meningkatkan kepuasan pelanggan dan peningkatan profit perusahaan.

Dari product_category didapat satu kategori dengan profit negatif yaitu "Bikes," dimana total penjualan terbesar ada di kategori tersebut. Berdasarkan data tersebut, dapat disimpulkan bahwa penjualan kategori Bikes dengan total penjualan paling tinggi mengalami profit yang negatif. Hal ini mengindikasikan adanya masalah dalam strategi penjualan atau penetapan harga. Pada insight sebelumnya, dinyatakan bahwa lebih dari 50% produk dijual dengan profit negatif, yang memperkuat indikasi adanya masalah dalam harga jual atau efisiensi biaya produksi.

Berdasarkan data pada tabel di atas, terdapat beberapa insight yang berhubungan dengan penjelasan sebelumnya mengenai kategori "Bikes" yang memiliki profit negatif meskipun total penjualannya terbesar. Pertama, penjualan subkategori seperti Road Bikes dan Touring Bikes menunjukkan total penjualan sebesar 28,681,989.48 dan 9,506,980.82, namun keduanya mengalami kerugian masing-masing sebesar -1,051,786.18 dan -945,090.58 dengan profit margin -3.67% dan -9.94%. Hal ini memperkuat indikasi bahwa terdapat masalah dalam strategi penjualan atau penetapan harga pada subkategori Bikes. Dibandingkan dengan subkategori lainnya, seperti Jerseys dalam kategori Clothing yang juga mengalami kerugian dengan profit margin -21.47% namun dengan total penjualan yang lebih kecil, dan Accessories seperti Tires and Tubes yang menunjukkan profit margin positif sebesar 37.43%, subkategori Bikes jelas memerlukan perhatian lebih.

Potensi penyebab dari profit negatif ini termasuk biaya produksi yang tinggi serta harga jual yang mungkin tidak sesuai dengan nilai pasar. Oleh karena itu, evaluasi terhadap harga jual dan strategi pemasaran serta upaya pengurangan biaya produksi menjadi sangat penting untuk meningkatkan profitabilitas subkategori ini. Dengan analisis yang lebih mendalam dan perubahan strategis, diharapkan subkategori Bikes dapat beralih dari profit negatif menuju hasil yang lebih positif.
