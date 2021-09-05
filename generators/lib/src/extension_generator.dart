import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:generators/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class ExtensionGenerator extends GeneratorForAnnotation<ExtensionAnnotation> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    ModelVisitor visitor = ModelVisitor();
    element.visitChildren(visitor);

    StringBuffer classBuffer = StringBuffer();

    classBuffer.writeln('extension GeneratedModel on ${visitor.className} {');

    classBuffer.writeln('Map<String, dynamic> get variables => {');

    for (final field in visitor.fields.keys) {
      final variable =
          field.startsWith('_') ? field.replaceFirst('_', '') : field;

      classBuffer.writeln("'$variable': $field,"); // EX: 'name': _name,
    }

    classBuffer.writeln('};');

    generateGettersAndSetters(visitor, classBuffer);
    classBuffer.writeln('}');
    return classBuffer.toString();
  }

  void generateGettersAndSetters(
      ModelVisitor visitor, StringBuffer classBuffer) {
// 1
    for (final field in visitor.fields.keys) {
      // 2
      final variable =
      field.startsWith('_') ? field.replaceFirst('_', '') : field;

      // 3 getter
      classBuffer.writeln(
          "${visitor.fields[field]} get $variable => variables['$variable'];");
      // EX: String get name => variables['name'];

      // 4 setter
      classBuffer.writeln(
          'set $variable(${visitor.fields[field]} $variable)');
      classBuffer.writeln('=> $field = $variable;');
      // EX: set name(String name) => _name = name;
    }
  }
}
