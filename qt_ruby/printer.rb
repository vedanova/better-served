#!/home/ckDev/.rvm/rubies/ruby-1.9.3-p484/bin/ruby
require 'Qt'
class QtApp < Qt::Widget

  def initialize
        super
        
        setWindowTitle "Patterns"
        
        resize 350, 280
        move 300, 300

        show
	
	painter = Qt::Painter.new self
        
	printer = Qt::Printer.new(Qt::Printer::HighResolution)
	
        if !setupPrinter(printer)
            return
        end
        
    end
    
     def setupPrinter(printer)
        dialog = Qt::PrintDialog.new(printer, self)
        return dialog.exec() == Qt::Dialog::Accepted
    end
    
    
    def paintEvent event
        
        painter = Qt::Painter.new self
        
        drawPatterns(painter)
        painter.end
    end

    
    def drawPatterns(painter)

        painter.setPen Qt::NoPen

        painter.setBrush Qt::HorPattern
        painter.drawRect 10, 15, 90, 60

        painter.setBrush Qt::VerPattern
        painter.drawRect 130, 15, 90, 60

        painter.setBrush Qt::CrossPattern
        painter.drawRect 250, 15, 90, 60

        painter.setBrush Qt::Dense7Pattern
        painter.drawRect 10, 105, 90, 60

        painter.setBrush Qt::Dense6Pattern
        painter.drawRect 130, 105, 90, 60

        painter.setBrush Qt::Dense5Pattern
        painter.drawRect 250, 105, 90, 60

        painter.setBrush Qt::BDiagPattern
        painter.drawRect 10, 195, 90, 60

        painter.setBrush Qt::FDiagPattern
        painter.drawRect 130, 195, 90, 60

        painter.setBrush Qt::DiagCrossPattern
        painter.drawRect 250, 195, 90, 60
	
	painter
    end
    
    def printdialog
        info = Qt::PrinterInfo
	default_printer = info.defaultPrinter
	printers = info.availablePrinters
	printer = printers[1]
	printer_name = printer.printerName
	
	dialog = Qt::PrintDialog.new
    end
    
end





app = Qt::Application.new ARGV
QtApp.new
app.exec