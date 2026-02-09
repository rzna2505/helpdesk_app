class Complaint {
  final int id;
  final String taskId;
  final String name;
  //final String hp; // Ditambah untuk Point 2 & 4
  final String unit; // Ditambah untuk Point 2 & 4
  final String problemDetail;
  final String category;
  final String status;
  final String location;
  final String terminalId;

  Complaint({
    required this.id,
    required this.taskId,
    required this.name,
    //required this.hp,
    required this.unit,
    required this.problemDetail,
    required this.category,
    required this.status,
    required this.location,
    required this.terminalId,
  });

  factory Complaint.fromJson(Map<String, dynamic> json) {
    // LOGIK: Ambil text sebelum \r\n\r\n (Point no. 6)
    String rawProblem = json['problem_detail'] ?? "";
    String cleanProblem = rawProblem.split('\r\n\r\n').first;

    // LOGIK: Ekstrak kategori dari tag <b> (Point no. 5)
    String rawDesc = json['description'] ?? "";
    String cleanCategory = "GENERAL";
    if (rawDesc.contains('<b>')) {
      cleanCategory = rawDesc.split('<b>')[1].split('</b>')[0];
    }

    return Complaint(
      id: json['id'] ?? 0,
      taskId: json['task_id'] ?? "",
      // Menyokong 'name' atau 'own_name' (Point 2 & 4)
      name: json['name'] ?? json['own_name'] ?? "UNKNOWN",
      // Menyokong 'hp' atau 'own_hp'
      //hp: json['hp'] ?? json['own_hp'] ?? "-",
      // Menyokong 'units' atau 'own_units'
      unit: json['units'] ?? json['own_units'] ?? "N/A",
      problemDetail: cleanProblem,
      category: cleanCategory,
      // Menggunakan tstatus jika status asal ada HTML
      status: json['tstatus'] ?? json['ticket_status'] ?? "NEW",
      location: json['location'] ?? "",
      terminalId: json['terminal_id'] ?? "",
    );
  }
}
