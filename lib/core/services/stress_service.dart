class StressService {
  double computeStress({
    required double heartRate,
    required double audioLevel,
  }) {
    double stress = 0;

    if (heartRate > 100) stress += 0.5;
    if (audioLevel > 0.7) stress += 0.3;

    return stress.clamp(0, 1);
  }
}
