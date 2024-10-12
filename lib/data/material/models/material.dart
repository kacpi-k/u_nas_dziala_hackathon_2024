class MaterialModel {
  final String materialId;
  final String trainingId;
  final String title;
  final String fileUrl;
  final String uploadedBy;
  final DateTime uploadedAt;

  MaterialModel({
    required this.materialId,
    required this.trainingId,
    required this.title,
    required this.fileUrl,
    required this.uploadedBy,
    required this.uploadedAt,
  });
}
