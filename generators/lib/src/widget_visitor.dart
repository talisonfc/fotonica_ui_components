import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/element/element.dart';

class WidgetVisitor extends SimpleElementVisitor<void>{

  late String className;
  late String sourceCode;

  @override
  void visitConstructorElement(ConstructorElement element) {
    final String elementReturnType = element.type.returnType.toString();
    className = elementReturnType.replaceAll("*", "");
  }

  @override
  void visitMethodElement(MethodElement element) {
    // print(element.name);
    sourceCode = element.source.contents.data;

    sourceCode = sourceCode.split("\n").map((it) => "\"${_prepare(it)}\\n\"").join("\n");
    print(sourceCode);
  }

  String _prepare(String i){
    String r = i.replaceAll("\"", "\\\"");
    return r;
  }

}