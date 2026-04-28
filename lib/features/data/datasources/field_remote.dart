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
  Future<Map<String, dynamic>> fetchAssignedFields() async{
    final uri= Uri.parse("$baseUrl/assignment/");
    final response= await http.get(uri);
    if(response.statusCode==200){
      return jsonDecode(response.body);
    }else{
      throw Exception("Failed to Load Table");
    }
  }

}