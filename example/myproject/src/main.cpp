#include "webview.h"
int main() {
    webview::webview w(false, nullptr);
    w.set_title("Example");
    w.navigate("https://example.com");
    w.run();
    return 0;
}