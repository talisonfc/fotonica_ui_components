import 'package:build/build.dart';
import 'package:generators/src/code_snapshot_generator.dart';
import 'package:generators/src/extension_generator.dart';
import 'package:generators/src/subclass_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder generateExtension(BuilderOptions options) =>
    SharedPartBuilder([ExtensionGenerator()], "extension_generator");

Builder generateSubclass(BuilderOptions options) =>
    SharedPartBuilder([SubclassGenerator()], "subclass_generator");

Builder generateCodeSnapshot(BuilderOptions options) =>
    SharedPartBuilder([CodeSnaphostGeneretor()], "code_snapshot_generator");
