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

    // extension ButtonsExampleSC on ButtonsExample {
    //   get sourceCode {
    //     return "";
    //   }
    // }

    // element.source;
    StringBuffer classBuffer = new StringBuffer();
    classBuffer.writeln("extension ${visitor.className}SourceCode on ${visitor.className} {");
    classBuffer.writeln("get sourceCode { return ${visitor.sourceCode};}");
    classBuffer.writeln("}");
    return classBuffer.toString();
  }

}