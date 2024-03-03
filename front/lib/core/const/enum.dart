enum ProjectStateEnum {
  before('BEFORE'),
  onProgress('ON_PROGRESS'),
  complete('COMPLETE');

  const ProjectStateEnum(this.code);
  factory ProjectStateEnum.getByCode(String code) {
    return ProjectStateEnum.values.firstWhere((value) => value.code == code);
  }
  final String code;
  
  
}
