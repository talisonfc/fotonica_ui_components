import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/element/element.dart';

class ModelVisitor extends SimpleElementVisitor<void>{

  late String className;
  final fields = <String, dynamic>{};
  final parameters = <String, dynamic>{};

  @override
  void visitConstructorElement(ConstructorElement element) {
    final String elementReturnType = element.type.returnType.toString();
    className = elementReturnType.replaceAll("*", "");

    element.parameters.forEach((parameter) {
      parameters[parameter.name] = parameter.type.toString();
    });
  }

  @override
  void visitFieldElement(FieldElement element) {
    final elementType = element.type.toString();
    fields[element.name] = elementType.replaceAll("*", "");
  }
}