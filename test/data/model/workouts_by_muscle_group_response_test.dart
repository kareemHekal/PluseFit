import 'package:flutter_test/flutter_test.dart';
import 'package:fit_zone/data/model/workouts_by_muscle_group_response.dart';
import 'package:fit_zone/domain/entity/workouts_entity.dart';

void main() {
  group('WorkoutsByMuscleGroupResponse', () {
    test('fromJson parses valid JSON', () {
      final json = {
        'message': 'Success',
        'totalMuscles': 2,
        'muscles': [
          {'_id': '1', 'name': 'Push Up', 'image': 'url1'},
          {'_id': '2', 'name': 'Squat', 'image': 'url2'},
        ]
      };
      final response = WorkoutsByMuscleGroupResponse.fromJson(json);
      expect(response.message, 'Success');
      expect(response.totalMuscles, 2);
      expect(response.muscles, isNotNull);
      expect(response.muscles!.length, 2);
      expect(response.muscles![0].sId, '1');
      expect(response.muscles![0].name, 'Push Up');
      expect(response.muscles![0].image, 'url1');
      expect(response.muscles![1].sId, '2');
      expect(response.muscles![1].name, 'Squat');
      expect(response.muscles![1].image, 'url2');
    });

    test('toJson serializes correctly', () {
      final response = WorkoutsByMuscleGroupResponse(
        message: 'Success',
        totalMuscles: 1,
        muscles: [
          WorkoutModel(sId: '1', name: 'Push Up', image: 'url1'),
        ],
      );
      final json = response.toJson();
      expect(json['message'], 'Success');
      expect(json['totalMuscles'], 1);
      expect(json['muscles'], isA<List<dynamic>>());
      expect(json['muscles'][0]['_id'], '1');
      expect(json['muscles'][0]['name'], 'Push Up');
      expect(json['muscles'][0]['image'], 'url1');
    });
  });

  group('WorkoutModel', () {
    test('fromJson, toJson, and toEntity work as expected', () {
      final json = {'_id': '1', 'name': 'Push Up', 'image': 'url1'};
      final model = WorkoutModel.fromJson(json);
      expect(model.sId, '1');
      expect(model.name, 'Push Up');
      expect(model.image, 'url1');
      final toJson = model.toJson();
      expect(toJson['_id'], '1');
      expect(toJson['name'], 'Push Up');
      expect(toJson['image'], 'url1');
      final entity = model.toEntity();
      expect(entity, isA<WorkoutEntity>());
      expect(entity.id, '1');
      expect(entity.name, 'Push Up');
      expect(entity.image, 'url1');
    });
  });
}
