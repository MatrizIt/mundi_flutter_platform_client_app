import '../../models/feedback.dart';
import '../../models/schedule.dart';

abstract class IScheduleRepository {
  Future<List<Schedule>?> schedules();
  Future<List<Schedule>?> filterSchedule();
  Future<void> cancelSchedule(int scheduleId);
  Future<void> sendFeedback(Feedback feedback);
}
