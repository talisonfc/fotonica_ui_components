

import 'package:build/build.dart';
import 'package:generators/src/code_snapshot_generator.dart';

class DocBuilder extends Builder{

  CodeSnaphostGeneretor codeSnaphostGeneretor = CodeSnaphostGeneretor();

  @override
  Map<String, List<String>> get buildExtensions => {
    "_example.dart": [".doc.dart"]
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    AssetId inputId = buildStep.inputId;

    String contents = await buildStep.readAsString(inputId);
    await buildStep.writeAsBytes(inputId, contents.codeUnits);
    // Each `buildStep` has a single input.
    // var inputId = buildStep.inputId;
    //
    // // Create a new target `AssetId` based on the old one.
    // var copy = inputId.addExtension('.copy');
    // var contents = await buildStep.readAsString(inputId);
    //
    // // Write out the new asset.
    // await buildStep.writeAsString(copy, contents);
  }

}