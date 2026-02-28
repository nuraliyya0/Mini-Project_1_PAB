import 'package:flutter/material.dart';

void main() {
  runApp(const FeraApp());
}

class FeraApp extends StatelessWidget {
  const FeraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

/* ================== MODEL ================== */

class Gown {
  final String name;
  final String price;

  Gown(this.name, this.price);
}

class Rental {
  final String gownName;
  final String renterName;
  final String rentDate;
  final String returnDate;
  final String price;

  Rental({
    required this.gownName,
    required this.renterName,
    required this.rentDate,
    required this.returnDate,
    required this.price,
  });
}

List<Gown> gownList = [
  Gown("Rose Gold Luxury", "Rp 1.500.000"),
  Gown("Pink Elegant Premium", "Rp 2.000.000"),
  Gown("Diamond Soft Blush", "Rp 2.500.000"),
];

List<Rental> rentalList = [];

/* ================== HOME ================== */

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFE4EC), Color(0xFFE75480)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "FERAGOWN",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Luxury Dress Rental",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFFE75480),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const GownListPage()),
                  );
                },
                child: const Text("Mulai Penyewaan"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/* ================== LIST GAUN ================== */

class GownListPage extends StatelessWidget {
  const GownListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pilih Gaun"),
        backgroundColor: const Color(0xFFE75480),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: gownList.length,
        itemBuilder: (context, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 5,
            margin: const EdgeInsets.only(bottom: 15),
            child: ListTile(
              title: Text(
                gownList[index].name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(gownList[index].price),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE75480),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          RentalFormPage(gown: gownList[index]),
                    ),
                  );
                },
                child: const Text("Sewa"),
              ),
            ),
          );
        },
      ),
    );
  }
}

/* ================== FORM PENYEWAAN ================== */

class RentalFormPage extends StatefulWidget {
  final Gown gown;

  const RentalFormPage({super.key, required this.gown});

  @override
  State<RentalFormPage> createState() => _RentalFormPageState();
}

class _RentalFormPageState extends State<RentalFormPage> {
  final nameController = TextEditingController();
  final rentDateController = TextEditingController();
  final returnDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Penyewaan"),
        backgroundColor: const Color(0xFFE75480),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              widget.gown.name,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Nama Penyewa",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: rentDateController,
              decoration: const InputDecoration(
                labelText: "Tanggal Sewa",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: returnDateController,
              decoration: const InputDecoration(
                labelText: "Batas Pengembalian",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE75480),
                ),
                onPressed: () {
                  rentalList.add(
                    Rental(
                      gownName: widget.gown.name,
                      renterName: nameController.text,
                      rentDate: rentDateController.text,
                      returnDate: returnDateController.text,
                      price: widget.gown.price,
                    ),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const RentalListPage()),
                  );
                },
                child: const Text("Simpan Penyewaan"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/* ================== DATA PENYEWAAN ================== */

class RentalListPage extends StatefulWidget {
  const RentalListPage({super.key});

  @override
  State<RentalListPage> createState() => _RentalListPageState();
}

class _RentalListPageState extends State<RentalListPage> {
  void deleteRental(int index) {
    setState(() {
      rentalList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Penyewaan"),
        backgroundColor: const Color(0xFFE75480),
      ),
      body: rentalList.isEmpty
          ? const Center(
              child: Text(
                "Belum ada data penyewaan",
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: rentalList.length,
              itemBuilder: (context, index) {
                final data = rentalList[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.2),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.gownName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text("Penyewa: ${data.renterName}"),
                      Text("Sewa: ${data.rentDate}"),
                      Text("Kembali: ${data.returnDate}"),
                      Text("Harga: ${data.price}"),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            deleteRental(index);
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFE75480),
        child: const Icon(Icons.home),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
            (route) => false,
          );
        },
      ),
    );
  }
}