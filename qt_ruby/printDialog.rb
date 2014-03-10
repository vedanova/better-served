#!/home/ckDev/.rvm/rubies/ruby-1.9.3-p484/bin/ruby
require 'Qt'
require 'debugger'
class QtApp < Qt::Widget
  WIDTH = 250
  HEIGHT = 150

  def initialize
    super
    setWindowTitle "Printing"
    resize WIDTH, HEIGHT
    center
    show
    print_page
  end

  def setupPrinter(printer)
    dialog = Qt::PrintDialog.new(printer, self)
    return dialog.exec() == Qt::Dialog::Accepted
  end

  def center
    qdw = Qt::DesktopWidget.new

    screenWidth = qdw.width
    screenHeight = qdw.height

    x = (screenWidth - WIDTH) / 2
    y = (screenHeight - HEIGHT) / 2

    move x, y
  end


  def print_page

    info = Qt::PrinterInfo
    default_printer = info.defaultPrinter
    printer = Qt::Printer.new(default_printer)

#         if !setupPrinter(printer)
#             return
#         end

    from = printer.fromPage()
    to = printer.toPage()

    progress = Qt::ProgressDialog.new(tr("Printing font samples..."), tr("&Cancel"),
                                      0, 1, self)
    progress.windowModality = Qt::ApplicationModal
    progress.windowTitle = tr("Printing")
    progress.minimum = from - 1
    progress.maximum = to

    painter = Qt::Painter.new
    painter.begin(printer)
    debugger
    painter.drawText(printer.pageRect, Qt::AlignCenter, "Qt by\nNokia");
#         for index in -1..to
#             if !firstPage
#                 printer.newPage()
#             end
#
#             $qApp.processEvents()
#             if progress.wasCanceled()
#                 break
#             end
#
#             printPage(index, painter, printer)
#             progress.value = index + 1
#             firstPage = false
#         end

    painter.end

  end
end


app = Qt::Application.new ARGV
QtApp.new
app.exec