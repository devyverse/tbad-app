enum PlayerLevel {
  beginner,
  intermediate,
  advanced,
}

enum PlayerStyle {
  offensive,
  defensive,
  allRound,
}

enum DominantHand {
  right,
  left,
}

class UserProfile {
  PlayerLevel level;
  PlayerStyle style;
  DominantHand hand;

  UserProfile({
    required this.level,
    required this.style,
    required this.hand,
  });

  Map<String, dynamic> toJson() => {
        "level": level.index,
        "style": style.index,
        "hand": hand.index,
      };

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        level: PlayerLevel.values[json["level"]],
        style: PlayerStyle.values[json["style"]],
        hand: DominantHand.values[json["hand"]],
      );
}
