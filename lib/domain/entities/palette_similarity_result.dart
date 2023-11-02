class PaletteSimilarityResult {

  final List<String> palette;
  final double distance;

  const PaletteSimilarityResult(this.palette, this.distance);



  @override
  bool operator ==(Object other) {
    final otherResult = other as PaletteSimilarityResult;
    final isSameDistance = distance == otherResult.distance;
    bool isSamePalette = true;
    for(int i = 0; i < palette.length ; i++) {
      if(palette[i] != otherResult.palette[i]) {
        isSamePalette = false;
        break;
      }
    }
    return isSamePalette;
  }






}