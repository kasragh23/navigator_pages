enum Gender{

  male('Mr','male'),
  female('Miss', 'female');

  const Gender(this.title, this.label);

  final String title;
  final String label;
}