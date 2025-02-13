// presentation/views/archive/archive_tab.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ArchiveTab extends ConsumerWidget {
  const ArchiveTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('Archive'),
          floating: true,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                child: Icon(
                  Icons.archive,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              title: Text('Archived Item ${index + 1}'),
              subtitle: Text('Date: ${DateTime.now().subtract(Duration(days: index)).toString().split(' ')[0]}'),
              trailing: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              ),
              onTap: () => context.push('/details/$index'),
            ),
            childCount: 50,
          ),
        ),
      ],
    );
  }
}
