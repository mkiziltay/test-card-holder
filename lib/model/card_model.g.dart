// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardInfoAdapter extends TypeAdapter<CardInfo> {
  @override
  final int typeId = 0;

  @override
  CardInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CardInfo(
      userName: fields[0] as String,
      cardCategory: fields[4] as String?,
      leftColor: fields[5] as String,
      cvvCode: fields[1] as String,
      expDate: fields[2] as String,
      cardNumber: fields[3] as String,
      rightColor: fields[6] as String,
      positionY: fields[7] as double,
      rotate: fields[8] as double,
      scale: fields[9] as double,
      opacity: fields[10] as double,
      id: fields[11] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CardInfo obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.cvvCode)
      ..writeByte(2)
      ..write(obj.expDate)
      ..writeByte(3)
      ..write(obj.cardNumber)
      ..writeByte(4)
      ..write(obj.cardCategory)
      ..writeByte(5)
      ..write(obj.leftColor)
      ..writeByte(6)
      ..write(obj.rightColor)
      ..writeByte(7)
      ..write(obj.positionY)
      ..writeByte(8)
      ..write(obj.rotate)
      ..writeByte(9)
      ..write(obj.scale)
      ..writeByte(10)
      ..write(obj.opacity)
      ..writeByte(11)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
