import 'package:flutter/material.dart';

SizedBox customButton({
  title,
  titleStyle,
  backgroundColor,
  padding,
  shape,
  onTap,
}) {
  return SizedBox(
    width: double.maxFinite,
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: padding,
        shape: shape,
      ),
      child: Text(
        title,
        style: titleStyle,
      ),
    ),
  );
}
