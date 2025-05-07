import 'package:flutter/material.dart';
import 'package:jugger/core/app_colors.dart';
import 'package:jugger/core/app_text_styles.dart';

class TournamentSolicitude extends StatefulWidget {
  const TournamentSolicitude({super.key});

  @override
  _TournamentSolicitudeState createState() => _TournamentSolicitudeState();
}

class _TournamentSolicitudeState extends State<TournamentSolicitude> {
  String? _selectedOption = 'A';
  final List<int> _fieldKeys = [];
  int _fieldCounter = 0;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 3; i++) {
      _addInitialTeamField();
    }
  }

  void _addInitialTeamField() {
    _fieldKeys.add(_fieldCounter);
    _fieldCounter++;
  }

  void _addTeamField() {
    if (_fieldKeys.length < 32) {
      setState(() {
        _fieldKeys.add(_fieldCounter);
        _fieldCounter++;
      });
    }
  }

  void _removeTeamField(int key) {
    if (_fieldKeys.length > 3) {
      setState(() {
        _fieldKeys.remove(key);
      });
    }
  }

  Widget _buildTeamField(int key) {
    return Padding(
      key: ValueKey(key),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Nombre del equipo",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.remove_circle, color: Colors.red),
            onPressed: () => _removeTeamField(key),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Crea un torneo',
            style: AppTextStyles.headLine1(),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                ..._fieldKeys.map((key) => _buildTeamField(key)),
                if (_fieldKeys.length < 32)
                  Center(
                    child: GestureDetector(
                      onTap: _addTeamField,
                      child: Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.add, size: 40, color: Colors.black),
                      ),
                    ),
                  ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selecciona una opción:',
                      style: AppTextStyles.subtitle1(),
                    ),
                    SizedBox(height: 8),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('Eliminacion directa',style: TextStyle(color: AppColors.secondary),),
                      leading: Radio<String>(
                        value: 'A',
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 8),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('Eliminacion doble',style: TextStyle(color: AppColors.secondary),),
                      leading: Radio<String>(
                        value: 'B',
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 8),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('Liga (FFA)',style: TextStyle(color: AppColors.secondary),),
                      leading: Radio<String>(
                        value: 'C',
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Opción seleccionada: $_selectedOption',
                      style: AppTextStyles.bodyText1(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}