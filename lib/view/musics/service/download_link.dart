import 'package:dio/dio.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';
import 'package:paw/core/constants/url.dart';

Future<String> getSoundCloudDownloadLink(String url) async {
  Dio dio = Dio();
  try {
    var formData = FormData.fromMap({
      "formurl": url,
    });
    final response = await dio.post(SoundCloud.forhub_io, data: formData);
    var webDocument = parse(response.data.toString());
    Element table = webDocument.getElementsByTagName("table")[0];
    Element downloadLinkElement = table.getElementsByTagName("a")[0];
    String downloadLink = downloadLinkElement.attributes["href"]!;
    return downloadLink;
  } catch (e) {
    print(e);
  }
  return "";
}
