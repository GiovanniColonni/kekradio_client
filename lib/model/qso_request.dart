class QSORequest {
  String callsign;
  String timestamp;
  int freq;
  String loc;
  int quality;
  String mode;

  QSORequest({
      this.callsign,
      this.timestamp,
      this.freq,
      this.loc,
      this.quality,
      this.mode
  });
}
