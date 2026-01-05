import 'package:get_it/get_it.dart';
import 'package:netsanet/features/auth/data/repository/auth_repository.dart';

import '../../features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> configureDependencies() async {
  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepository());

  // Blocs
  sl.registerFactory(() => AuthBloc(authRepository: sl()));
}
