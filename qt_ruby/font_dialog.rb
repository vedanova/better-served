
#!/home/ckDev/.rvm/rubies/ruby-1.9.3-p484/bin/ruby

require 'Qt'


class QtApp < Qt::Widget

    slots 'showDialog()'

    def initialize
        super
        
        setWindowTitle "Font dialog"
       
        init_ui
       
        resize 400, 300
        move 300, 300

        show
    end
    
    def init_ui
    
        @label = Qt::Label.new "ZetCode Ruby Qt tutorial", self

        vbox = Qt::VBoxLayout.new self
        @label.setAlignment Qt::AlignCenter
        vbox.addWidget @label

    end   
    
    def mousePressEvent event

        ok = Qt::Boolean.new
        font = Qt::FontDialog.getFont ok
        
        if not ok 
            return
        end

        @label.setFont font
    end
end

app = Qt::Application.new ARGV
QtApp.new
app.exec