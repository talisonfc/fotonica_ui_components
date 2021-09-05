import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:generators/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class SubclassGenerator extends GeneratorForAnnotation<SubclassAnnotation> {
  // 1
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    // 2
    final visitor = ModelVisitor();
    element.visitChildren(
        visitor); // Visits all the children of element in no particular order.

    // 3
    final className = '${visitor.className}Gen'; // EX: 'ModelGen' for 'Model'.

    // 4
    final classBuffer = StringBuffer();

    // start class definition
    classBuffer.writeln('class $className extends ${visitor.className} {');

    // create property variables
    classBuffer.writeln('Map<String, dynamic> variables = {};');

    String parameters = visitor.parameters.map((name, type) => MapEntry("required this.$name", type)).keys.join(",");

    // open cosntructor
    // if(visitor.parameters.length > 0){
    //   classBuffer.writeln('$className({$parameters}) {');
    // }
    // else{
    //   classBuffer.writeln('$className() {');
    // }
    classBuffer.writeln('$className() {');

    // initialize Map variables
    for (final field in visitor.fields.keys) {
      // remove '_' from private variables
      final variable =
          field.startsWith('_') ? field.replaceFirst('_', '') : field;

      classBuffer.writeln("variables['${variable}'] = super.$field;");
      // EX: variables['name'] = super._name;
    }

    // close constructor
    classBuffer.writeln('}');

    // create getters and setters
    generateGettersAndSetters(visitor, classBuffer);

    // close class
    classBuffer.writeln('}');

    // return class content
    return classBuffer.toString();
  }

  // method to generate getters and setters based on fileds
  void generateGettersAndSetters(
      ModelVisitor visitor, StringBuffer classBuffer) {

    for (final field in visitor.fields.keys) {
      final variable =
          field.startsWith('_') ? field.replaceFirst('_', '') : field;

      classBuffer.writeln(
          "${visitor.fields[field]} get $variable => variables['$variable'];");
      // EX: String get name => variables['name'];

      classBuffer
          .writeln('set $variable(${visitor.fields[field]} $variable) {');
      classBuffer.writeln('super.$field = $variable;');
      classBuffer.writeln("variables['$variable'] = $variable;");
      classBuffer.writeln('}');

      // EX: set name(String name) {
      //       super._name = name;
      //       variables['name'] = name;
      //     }
    }
  }
}
