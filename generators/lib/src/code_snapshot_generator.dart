import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:generators/src/widget_visitor.dart';
import 'package:source_gen/source_gen.dart';
import 'dart:core';

class CodeSnaphostGeneretor extends GeneratorForAnnotation<CodeSnapshotAnnotation>{

  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {

    WidgetVisitor visitor = WidgetVisitor();
    element.visitChildren(visitor);

    // element.source;
    StringBuffer classBuffer = new StringBuffer();
    classBuffer.writeln("class ${visitor.className}SourceCode{");
    classBuffer.writeln("String sourceCode = ${visitor.sourceCode};");
    classBuffer.writeln("}");
    return classBuffer.toString();
  }

}