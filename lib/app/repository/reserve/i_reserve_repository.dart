abstract class IReserveRepository {
  Future<void> createReserve(
      {required int entrepreneurId,
      required String scheduledDate,
      required int modalityId});
  Future<List<String>> checkHour({required int entrepreneurId, required String date});
}
