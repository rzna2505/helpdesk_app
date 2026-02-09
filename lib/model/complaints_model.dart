import 'package:flutter/material.dart';

class Complaint {
  final int id;
  final String taskId;
  final String name;
  final String problemDetail;
  final String category;
  final String status;
  final String location;
  final String terminalId;

  Complaint({
    required this.id,
    required this.taskId,
    required this.name,
    required this.problemDetail,
    required this.category,
    required this.status,
    required this.location,
    required this.terminalId,
  });

  factory Complaint.fromJson(Map<String, dynamic> json) {
    // LOGIK 1: Ambil text sebelum \r\n\r\n (Ikut json detail.docx point no. 6)
    String rawProblem = json['problem_detail'] ?? "";
    String cleanProblem = rawProblem.split('\r\n\r\n').first;

    // LOGIK 2: Ekstrak kategori dari tag <b> (Ikut json detail.docx point no. 2)
    String rawDesc = json['description'] ?? "";
    String cleanCategory = "GENERAL";
    if (rawDesc.contains('<b>')) {
      cleanCategory = rawDesc.split('<b>')[1].split('</b>')[0];
    }

    return Complaint(
      id: json['id'],
      taskId: json['task_id'] ?? "",
      name: json['name'] ?? "",
      problemDetail: cleanProblem,
      category: cleanCategory,
      status: json['ticket_status'] ?? "",
      location: json['location'] ?? "",
      terminalId: json['terminal_id'] ?? "",
    );
  }
}
