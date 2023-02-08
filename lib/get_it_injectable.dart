import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

@InjectableInit(  
  initializerName: 'init', // default  
  preferRelativeImports: true, // default  
  asExtension: false, // default  
)  
void configureDependencies() => getIt.init();  
