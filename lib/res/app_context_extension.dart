import 'package:flutter/material.dart';

import 'resources.dart';

extension AppContext on BuildContext {
  Resources get resources => Resources.of(this);
}
