#!/home/ckDev/.rvm/rubies/ruby-1.9.3-p484/bin/ruby

require 'Qt'

require 'Qt'


class QtApp < Qt::Widget

    slots 'showDialog()'

    def initialize
        super
        
        setWindowTitle "Input dialog"
       
        init_ui
       
        resize 400, 80
        move 300, 300

        show
    end
    
    def init_ui
    
        show = Qt::PushButton.new "Dialog", self

        connect(show, SIGNAL("clicked()"),
            self, SLOT("showDialog()"))

        show.move 20, 20

        @edit = Qt::LineEdit.new self
        @edit.move 130, 22

	printer = Qt::LineEdit.new self
        printer.move 130, 50
	
	printer = Qt::Printer;
	dialog = Qt::PrintDialog.new(printer), self
    end   
    
    def showDialog
        
        text = Qt::InputDialog.getText self, "Input Dialog",
            "Enter your name"
         
        if text != nil 
            name = text.strip
            if not name.empty?
                @edit.setText name
            end
        end
    end

end

app = Qt::Application.new ARGV
QtApp.new
app.exec