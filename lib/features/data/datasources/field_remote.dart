import 'dart:convert';
import 'package:http/http.dart' as http;

class FieldRemoteSource {
  final String baseUrl;

  FieldRemoteSource(this.baseUrl);

  Future<Map<String, dynamic>> fetchDashboardStats(int userId, int role) async {
    final uri = Uri.parse('$baseUrl/count/?user_id=$userId&role=$role');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load dashboard stats");
    }
  }
  Future<Map<String, dynamic>> fetchPie(int userId, int role) async {
    final uri = Uri.parse('$baseUrl/overview/?user_id=$userId&role=$role');
    final response = await http.get(uri);

    if (response.statusCode == 200) {

      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load dashboard stats");
    }
  }
  Future<List<Map<String, dynamic>>> fetchAssignedFields() async {
    final uri = Uri.parse("$baseUrl/assignment/");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      return data.map<Map<String, dynamic>>((item) {
        return {
          "field_id": item["field_id"],
          "field_name": item["field_name"],
          "crop_type": item["crop_type"],
          "stage": item["stage"],
          "agent": item["agent"] ?? {},
        };
      }).toList();
    } else {
      throw Exception("Failed to Load Table");
    }
  }

  Future<List<Map<String, dynamic>>> fetchAgentsFields(int id) async {
    final uri = Uri.parse("$baseUrl/fields/?id=$id");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      return data.map<Map<String, dynamic>>((item) {
        return {
          "field_id": item["field_id"],
          "field_name": item["field_name"],
          "crop_type": item["crop_type"],
          "stage": item["stage"],

        };
      }).toList();
    } else {
      throw Exception("Failed to Load Table");
    }
  }
}