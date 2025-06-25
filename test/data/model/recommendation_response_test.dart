import 'package:flutter_test/flutter_test.dart';
import 'package:fit_zone/data/model/recommendation_response.dart';
import 'package:fit_zone/domain/entity/recommendation_entity.dart';

void main() {
  group('RecommendationResponse', () {
    test('fromJson parses valid JSON', () {
      final json = {
        'message': 'Success',
        'totalMuscles': 2,
        'muscles': [
          {'_id': '1', 'name': 'Chest', 'image': 'url1'},
          {'_id': '2', 'name': 'Back', 'image': 'url2'},
        ]
      };
      final response = RecommendationResponse.fromJson(json);
      expect(response.message, 'Success');
      expect(response.totalMuscles, 2);
      expect(response.muscles, isNotNull);
      expect(response.muscles!.length, 2);
      expect(response.muscles![0].sId, '1');
      expect(response.muscles![0].name, 'Chest');
      expect(response.muscles![0].image, 'url1');
      expect(response.muscles![1].sId, '2');
      expect(response.muscles![1].name, 'Back');
      expect(response.muscles![1].image, 'url2');
    });

    test('toJson serializes correctly', () {
      final response = RecommendationResponse(
        message: 'Success',
        totalMuscles: 1,
        muscles: [
          MuscleModel(sId: '1', name: 'Chest', image: 'url1'),
        ],
      );
      final json = response.toJson();
      expect(json['message'], 'Success');
      expect(json['totalMuscles'], 1);
      expect(json['muscles'], isA<List<dynamic>>());
      expect(json['muscles'][0]['_id'], '1');
      expect(json['muscles'][0]['name'], 'Chest');
      expect(json['muscles'][0]['image'], 'url1');
    });
  });

  group('MuscleModel', () {
    test('fromJson, toJson, and toEntity work as expected', () {
      final json = {'_id': '1', 'name': 'Chest', 'image': 'url1'};
      final model = MuscleModel.fromJson(json);
      expect(model.sId, '1');
      expect(model.name, 'Chest');
      expect(model.image, 'url1');
      final toJson = model.toJson();
      expect(toJson['_id'], '1');
      expect(toJson['name'], 'Chest');
      expect(toJson['image'], 'url1');
      final entity = model.toEntity();
      expect(entity, isA<MuscleEntity>());
      expect(entity.id, '1');
      expect(entity.name, 'Chest');
      expect(entity.image, 'url1');
    });
  });
}
