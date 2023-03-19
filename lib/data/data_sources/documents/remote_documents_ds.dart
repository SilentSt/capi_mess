import 'package:chopper/chopper.dart';
import 'package:template/data/models/models.dart';

part 'remote_documents_ds.chopper.dart';

@ChopperApi(baseUrl: 'documents/')
abstract class RemoteDocumentsDataSource extends ChopperService {
  static RemoteDocumentsDataSource create([ChopperClient? client]) =>
      _$RemoteDocumentsDataSource(client);

  @Get(path: r'{uuid}/stats')
  Future<Response<DocumentStats>> getById(@Path('uuid') String uuid);


}
