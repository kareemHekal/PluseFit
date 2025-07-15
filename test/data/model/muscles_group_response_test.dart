import 'package:flutter_test/flutter_test.dart';
import 'package:fit_zone/data/model/muscles_group_response.dart';

void main() {
  group('MusclesGroupResponse', () {
    test('fromJson parses valid JSON', () {
      final json = {
        'message': 'Success',
        'musclesGroup': [
          {'_id': '1', 'name': 'Chest'},
          {'_id': '2', 'name': 'Back'},
        ]
      };
      final response = MusclesGroupResponse.fromJson(json);
      expect(response.message, 'Success');
      expect(response.musclesGroup, isNotNull);
      expect(response.musclesGroup!.length, 2);
      expect(response.musclesGroup![0].sId, '1');
      expect(response.musclesGroup![0].name, 'Chest');
      expect(response.musclesGroup![1].sId, '2');
      expect(response.musclesGroup![1].name, 'Back');
    });

    test('toJson serializes correctly', () {
      final response = MusclesGroupResponse(
        message: 'Success',
        musclesGroup: [
          MusclesGroupModel(sId: '1', name: 'Chest'),
          MusclesGroupModel(sId: '2', name: 'Back'),
        ],
      );
      final json = response.toJson();
      expect(json['message'], 'Success');
      expect(json['musclesGroup'], isA<List<dynamic>>());
      expect(json['musclesGroup'][0]['_id'], '1');
      expect(json['musclesGroup'][0]['name'], 'Chest');
      expect(json['musclesGroup'][1]['_id'], '2');
      expect(json['musclesGroup'][1]['name'], 'Back');
    });
  });

  group('MusclesGroupModel', () {
    test('fromJson and toJson work as expected', () {
      final json = {'_id': '1', 'name': 'Chest'};
      final model = MusclesGroupModel.fromJson(json);
      expect(model.sId, '1');
      expect(model.name, 'Chest');
      final toJson = model.toJson();
      expect(toJson['_id'], '1');
      expect(toJson['name'], 'Chest');
    });
  });
}
