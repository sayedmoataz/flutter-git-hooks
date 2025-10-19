// ignore_for_file: avoid_print

import 'dart:io';

Future<void> main() async {
  print('🔧 Setting up project development environment...\n');

  // 1. Install lefthook globally
  await _runCommand('📦 Installing lefthook_dart globally...', 'flutter', [
    'pub',
    'global',
    'activate',
    'lefthook_dart',
  ]);

  // 2. Get dependencies
  await _runCommand('📥 Getting project dependencies...', 'flutter', ['pub', 'get']);

  // 3. Install git hooks
  await _runCommand('🪝 Installing git hooks...', 'lefthook', ['install']);

  // 4. Run initial format
  print('✨ Running initial code formatting...');
  await Process.run('dart', ['format', '.']);

  // 5. Sort imports
  print('📚 Sorting imports...');
  await Process.run('flutter', ['pub', 'run', 'import_sorter:main']);

  print('\n✅ Project setup complete! You\'re ready to commit.');
  print('💡 Tip: Hooks will run automatically on commit and push.');
}

Future<void> _runCommand(String message, String command, List<String> args) async {
  print(message);
  final result = await Process.run(command, args);

  if (result.exitCode != 0) {
    print('❌ Failed: ${result.stderr}');
    exit(1);
  }

  if (result.stdout.toString().isNotEmpty) {
    print(result.stdout);
  }
}
