#!/usr/local/bin/perl
################################################################################
##                                                                            ##
## Author     : Monty Scroggins                                               ##
## Description:                                                               ##
##                                                                            ##
##                                                                            ##
##                                                                            ##
##  Parameters:   parameters!!!!  we dont need no stinking parameters!!!!!    ##
##                                                                            ##
## +++++++++++++++++++++++++++ Maintenance Log ++++++++++++++++++++++++++++++ ##
## Tue Sep 1 02:30:59 GMT 1998  Monty Scroggins - Script created.                                
################################################################################
use Tk;
use Tk::Dialog;

#perl variables
$|=1; # set output buffering to off
$[ = 0; # set array base to 1
$, = ' '; # set output field separator
$\ = "\n"; # set output record separator

#The colors
$txtbackground="snow2";
$background="bisque3";
$troughbackground="bisque4";
$buttonbackground="tan";
$txtforeground="black";
$winfont="8x13bold";
$trbgd="bisque4";
$labelbackground="bisque2";
$entrywidth=10;
$commentwidth=30;
$ypad=0;
$outfile="fairsplit.txt";
$stringpad="          ";

#the list of variables used to populate the entry widgets
@variablelist=(
   "aincomedata",  
   "apercentdata",
   "bincomedata",  
   "bpercentdata",  
   );

#the list of arrays used to populate the listboxes
@arraylist=(
   "adatalist",
   "acommentlist",
   "bdatalist",
   "bcommentlist",
   "bothdatalist",
   "bothcommentlist",
   );
  
#the file sourced upon startup to load parameter histories
$checkpointfile="fairsplit.conf";

#if the checkpoint file exists, execute it
if (-e $checkpointfile) {
  require ("$checkpointfile");
  }

$LW = MainWindow->new;
$LW->minsize(10,5);
$LW->maxsize(10,5);
#set the window title
$LW->configure(
  -title=>"Fairsplit",
  -background=>$background,
  -foreground=>$txtforeground,
  -borderwidth=>1,
  -relief=>'raised',
  );
  
#label frame 
$listframeall=$LW->Frame(
  -borderwidth=>'0',
  -relief=>'flat',
  -background=>$background,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  )->pack(
    -fill=>'both',
    -expand=>1,
    -pady=>0,
    -padx=>0,
    );

#label frame 
$buttonframe=$LW->Frame(
  -borderwidth=>1,
  -relief=>'raised',
  -background=>$background,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  )->pack(
    -fill=>'x',
    -pady=>0,
    -padx=>0,
    -side=>'bottom',
    );

#label frame 

$listframe1=$listframeall->Frame(
  -borderwidth=>1,
  -relief=>'sunken',
  -background=>$background,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  )->pack(
    -fill=>'both',
    -expand=>0,    
    -pady=>0,
    -padx=>0,
    -side=>'top',
    );

$listframe2=$listframeall->Frame(
  -borderwidth=>'1',
  -relief=>'sunken',
  -background=>$background,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  )->pack(
    -fill=>'both',
    -expand=>1,
    -pady=>0,
    -padx=>0,
    -side=>'top',
    );

$listframe3=$listframeall->Frame(
  -borderwidth=>'1',
  -relief=>'sunken',
  -background=>$background,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  )->pack(
    -fill=>'both',
    -expand=>1,
    -pady=>0,
    -padx=>0,
    -side=>'top',
    );

$listframe1->Label(
  -text=>'A',
  -borderwidth=>'1',
  -background=>$labelbackground,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -relief=>'raised',
  -width=>$entrywidth,  
  )->pack(
    -padx=>0,
    -pady=>0,
    -expand=>0,
    -fill=>'x',
    ); 


$listframe2->Label(
  -text=>'B',
  -borderwidth=>'1',
  -background=>$labelbackground,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -relief=>'raised',
  -width=>$entrywidth,
  )->pack(
    -padx=>0,
    -pady=>0,
    -expand=>0,
    -fill=>'x',
    ); 
    

$listframe3->Label(
  -text=>'SHARED',
  -borderwidth=>'1',
  -background=>$labelbackground,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -relief=>'raised',
  -width=>$entrywidth,  
  )->pack(
    -padx=>0,
    -pady=>0,
    -expand=>0,
    -fill=>'x',    
    ); 

##############################################    
#                              A Column

#######################
#the label column on the left

$alabelframe=$listframe1->Frame(
  -borderwidth=>'1',
  -background=>$background,
  -highlightthickness=>0,
  -relief=>'flat', 
  )->pack(
    -padx=>0,
    -pady=>0,
    -expand=>1,
    -side=>'left',
    -fill=>'y',
    ); 
 
$alabelframe->Label(
  -text=>'  Income:',
  -borderwidth=>'1',
  -background=>$background,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -width=>10,
  -relief=>'flat',
  )->pack(
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,
    -fill=>'x'
    ); 

$alabelframe->Label(
  -text=>' Percent:',
  -borderwidth=>'1',
  -background=>$background,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -width=>10,
  -relief=>'flat',
  )->pack(
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,
    -fill=>'x'
    ); 

$alabelframe->Label(
  -text=>'    Data:',
  -borderwidth=>'1',
  -background=>$background,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -width=>10,
  -relief=>'flat',
  )->pack(
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,
    -fill=>'x'
    ); 

$alabelframe->Label(
  -text=>' A Check:',
  -borderwidth=>'1',
  -background=>$background,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -width=>10,
  -relief=>'flat',
  )->pack(
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,
    -fill=>'x',
    -side=>'bottom',
    ); 
      
    
$alabelframe->Label(
  -text=>' A Total:',
  -borderwidth=>'1',
  -background=>$background,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -width=>10,
  -relief=>'flat',
  )->pack(
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,
    -fill=>'x',
    -side=>'bottom',
    ); 
 
$aincome=$listframe1->Entry(
  -textvariable=>\$aincomedata,
  -borderwidth=>'1',
  -background=>$txtbackground,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -relief=>'sunken',
  -width=>$entrywidth,
  -justify=>'right',
  )->pack(
    -anchor=>'sw',
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,
    ); 
    
$apercent=$listframe1->Entry(
  -textvariable=>\$apercentdata,
  -borderwidth=>'1',
  -background=>$txtbackground,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -relief=>'sunken',
  -width=>$entrywidth,
  -justify=>'right',  
  )->pack(
    -anchor=>'sw',
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,
    ); 

$aentryframe=$listframe1->Frame(
  -borderwidth=>'0',
  -background=>$background,
  -highlightthickness=>0,
  -width=>$entrywidth,
  -relief=>'sunken',
  )->pack(
    -anchor=>'sw',
    -padx=>0,
    -pady=>$ypad,
    -expand=>1,
    -fill=>'x',
    );

$aentry=$aentryframe->Entry(
  -textvariable=>\$aentrydata,
  -borderwidth=>'1',
  -background=>$txtbackground,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -relief=>'sunken',
  -width=>$entrywidth,
  -justify=>'right',  
  )->pack(
    -anchor=>'sw',
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,
    -side=>'left',
    ); 

$aentrycomment=$aentryframe->Entry(
  -textvariable=>\$acommentdata,
  -borderwidth=>'1',
  -background=>$txtbackground,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -width=>$commentwidth,
  -relief=>'sunken',
  )->pack(
    -side=>'left',
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,
    );
           
$listframe1->Entry(
  -textvariable=>\$apaycheckentry,
  -borderwidth=>'1',
  -background=>$txtbackground,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -relief=>'sunken',
  -width=>$entrywidth,
  -justify=>'right',  
  )->pack(
    -side=>'bottom',
    -anchor=>'sw',    
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,  
    ); 


$listframe1->Entry(
  -textvariable=>\$atotalentry,
  -borderwidth=>'1',
  -background=>$txtbackground,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -relief=>'sunken',
  -width=>$entrywidth,
  -justify=>'right',  
  )->pack(
    -side=>'bottom',
    -anchor=>'sw',    
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,  
    ); 

$scroll1=$listframe1->Scrollbar(
  -orient=>'vert',
  -elementborderwidth=>1,
  -highlightthickness=>0,
  -background=>$background,
  -troughcolor=>$troughbackground,
  -relief=>'flat',)
  ->pack(
    -side=>'right',
    -fill=>'y',
    );

$adatalist=$listframe1->Listbox(
  -yscrollcommand=>['set', $scroll1],
  -relief=>'sunken',
  -font=>'8x13bold',
  -highlightthickness=>0,
  -background=>$txtbackground,
  -foreground=>$txtforeground,
  -selectforeground=>$txtforeground,
  -selectbackground=>'#c0d0c0',
  -borderwidth=>1,
  -selectmode=>'extended',
  -setgrid=>'yes',
  -width=>$entrywidth,
  -height=>5,
  )->pack(
    -fill=>'y',
    -expand=>1,
    -pady=>$ypad,
    -side=>'left',
    );
    
$acommentlist=$listframe1->Listbox(
  -yscrollcommand=>['set', $scroll1],
  -relief=>'sunken',
  -font=>'8x13bold',
  -highlightthickness=>0,
  -background=>$txtbackground,
  -foreground=>$txtforeground,
  -selectforeground=>$txtforeground,
  -selectbackground=>'#c0d0c0',
  -borderwidth=>1,
  -selectmode=>'extended',
  -setgrid=>'yes',
  -width=>$commentwidth,
  -height=>3,  
  )->pack(
    -fill=>'both',
    -expand=>1,
    -pady=>$ypad,
    -side=>'left'
    );
#scroll1->configure(-command=>['yview', $adatalist]);
$scroll1->configure(-command=>\&tie_ayview);
##############################################    
#                              B Column

#######################
#the label column on the left

$blabelframe=$listframe2->Frame(
  -borderwidth=>'1',
  -background=>$background,
  -highlightthickness=>0,
  -relief=>'flat',
  -width=>3,  
  )->pack(
    -padx=>0,
    -pady=>0,
    -expand=>1,
    -side=>'left',
    -fill=>'y',
    ); 

$blabelframe->Label(
  -text=>'  Income:',
  -borderwidth=>'1',
  -background=>$background,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -width=>10,
  -relief=>'flat',
  )->pack(
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,
    -fill=>'x'
    ); 

$blabelframe->Label(
  -text=>' Percent:',
  -borderwidth=>'1',
  -background=>$background,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -width=>10,
  -relief=>'flat',
  )->pack(
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,
    -fill=>'x'
    ); 

$blabelframe->Label(
  -text=>'    Data:',
  -borderwidth=>1,
  -background=>$background,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -width=>10,
  -relief=>'flat',
  )->pack(
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,
    -fill=>'x'
    ); 

$blabelframe->Label(
  -text=>' B Check:',
  -borderwidth=>'1',
  -background=>$background,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -width=>10,
  -relief=>'flat',
  )->pack(
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,
    -fill=>'x',
    -side=>'bottom',
    ); 
          
$blabelframe->Label(
  -text=>' B Total:',
  -borderwidth=>'1',
  -background=>$background,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -width=>10,
  -relief=>'flat',
  )->pack(
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,
    -fill=>'x',
    -side=>'bottom',
    ); 

$bincome=$listframe2->Entry(
  -textvariable=>\$bincomedata,
  -borderwidth=>'1',
  -background=>$txtbackground,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -relief=>'sunken',
  -width=>$entrywidth,
  -justify=>'right',
  )->pack(
    -anchor=>'sw',
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,
    ); 

    
$bpercent=$listframe2->Entry(
  -textvariable=>\$bpercentdata,
  -borderwidth=>'1',
  -background=>$txtbackground,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -relief=>'sunken',
  -width=>$entrywidth,
  -justify=>'right',  
  )->pack(
    -anchor=>'sw',
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,
    ); 
    
$bentryframe=$listframe2->Frame(
  -borderwidth=>0,
  -background=>$background,
  -highlightthickness=>0,
  -width=>$entrywidth,
  -relief=>'sunken',
  )->pack(
    -anchor=>'sw',
    -padx=>0,
    -pady=>$ypad,
    -expand=>1,
    -fill=>'x',
    );

    
$bentry=$bentryframe->Entry(
  -textvariable=>\$bentrydata,
  -borderwidth=>'1',
  -background=>$txtbackground,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -relief=>'sunken',
  -width=>$entrywidth,
  -justify=>'right',  
  )->pack(
    -anchor=>'sw',
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,
    -side=>'left',    
    ); 

$bentrycomment=$bentryframe->Entry(
  -textvariable=>\$bcommentdata,
  -borderwidth=>'1',
  -background=>$txtbackground,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -width=>$commentwidth,
  -relief=>'sunken',
  )->pack(
    -side=>'left',
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,
    );
           
$listframe2->Entry(
  -textvariable=>\$bpaycheckentry,
  -borderwidth=>'1',
  -background=>$txtbackground,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -relief=>'sunken',
  -width=>$entrywidth,
  -justify=>'right',  
  )->pack(
    -side=>'bottom',
    -anchor=>'sw',    
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,  
    ); 

$listframe2->Entry(
  -textvariable=>\$btotalentry,
  -borderwidth=>'1',
  -background=>$txtbackground,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -relief=>'sunken',
  -width=>$entrywidth,
  -justify=>'right',  
  )->pack(
    -side=>'bottom',
    -anchor=>'sw',
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,
    ); 
    

$scroll2=$listframe2->Scrollbar(
  -orient=>'vert',
  -elementborderwidth=>1,
  -highlightthickness=>0,
  -background=>$background,
  -troughcolor=>$troughbackground,
  -relief=>'flat',
  )->pack(
    -side=>'right',
    -fill=>'y',
    );

$bdatalist=$listframe2->Listbox(
  -yscrollcommand=>['set', $scroll2],
  -relief=>'sunken',
  -font=>'8x13bold',
  -highlightthickness=>0,
  -background=>$txtbackground,
  -foreground=>$txtforeground,
  -selectforeground=>$txtforeground,
  -selectbackground=>'#c0d0c0',
  -borderwidth=>1,
  -selectmode=>'extended',
  -setgrid=>'yes',
  -width=>$entrywidth,
  -height=>5,  
  )->pack(
    -fill=>'both',
    -expand=>1,
    -pady=>$ypad,
    -side=>'left',    
    );
    
$bcommentlist=$listframe2->Listbox(
  -yscrollcommand=>['set', $scroll2],
  -relief=>'sunken',
  -font=>'8x13bold',
  -highlightthickness=>0,
  -background=>$txtbackground,
  -foreground=>$txtforeground,
  -selectforeground=>$txtforeground,
  -selectbackground=>'#c0d0c0',
  -borderwidth=>1,
  -selectmode=>'extended',
  -setgrid=>'yes',
  -width=>$commentwidth,
  -height=>5,  
  )->pack(
    -fill=>'both',
    -expand=>1,
    -pady=>$ypad,
    -side=>'left'
    );
#$scroll2->configure(-command=>['yview', $bdatalist]);
$scroll2->configure(-command=>\&tie_byview);


##############################################    
#                              BOTH Column

$bothlabelframe=$listframe3->Frame(
  -borderwidth=>'1',
  -background=>$background,
  -highlightthickness=>0,
  -relief=>'flat',  
  )->pack(
    -padx=>0,
    -pady=>0,
    -expand=>1,
    -side=>'left',
    -fill=>'y',
    ); 
    
$bothlabelframe->Label(
  -text=>'    Data:',
  -borderwidth=>'1',
  -background=>$background,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -width=>10,
  -relief=>'flat',
  )->pack(
    -side=>'top',
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,
    -fill=>'x'
    ); 

$bothlabelframe->Label(
  -text=>'A+B Total:',
  -borderwidth=>'1',
  -background=>$background,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -width=>10,
  -relief=>'flat',
  )->pack(
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,
    -fill=>'x',
    -side=>'bottom',
    ); 

$bothentryframe=$listframe3->Frame(
  -borderwidth=>0,
  -background=>$background,
  -highlightthickness=>0,
  -width=>$entrywidth,
  -relief=>'sunken',
  )->pack(
    -anchor=>'sw',
    -padx=>0,
    -pady=>$ypad,
    -expand=>1,
    -fill=>'x',
    );
    
$bothentry=$bothentryframe->Entry(
  -textvariable=>\$bothentrydata,
  -borderwidth=>'1',
  -background=>$txtbackground,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -width=>$entrywidth,
  -relief=>'sunken',
  -justify=>'right',
  )->pack(
    -side=>'left',
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,
    );
    
$bothentrycomment=$bothentryframe->Entry(
  -textvariable=>\$bothentrycommentdata,
  -borderwidth=>'1',
  -background=>$txtbackground,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -width=>$commentwidth,
  -relief=>'sunken',
  )->pack(
    -side=>'left',
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,
    );
  
$listframe3->Entry(
  -textvariable=>\$bothtotalentry,
  -borderwidth=>'1',
  -background=>$txtbackground,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -relief=>'sunken',
  -width=>$entrywidth,
  -justify=>'right',  
  )->pack(
    -side=>'bottom',
    -anchor=>'sw',
    -padx=>0,
    -pady=>$ypad,
    -expand=>0,
    );   
                  
$scroll3=$listframe3->Scrollbar(
  -orient=>'vert',
  -elementborderwidth=>1,
  -highlightthickness=>0,
  -background=>$background,
  -troughcolor=>$troughbackground,
  -relief=>'flat',)
  ->pack(
    -side=>'right',
    -fill=>'y',
    );

$bothdatalist=$listframe3->Listbox(
  -yscrollcommand=>['set', $scroll3],
  -relief=>'sunken',
  -font=>'8x13bold',
  -highlightthickness=>0,
  -background=>$txtbackground,
  -foreground=>$txtforeground,
  -selectforeground=>$txtforeground,
  -selectbackground=>'#c0d0c0',
  -borderwidth=>1,
  -selectmode=>'extended',
  -setgrid=>'yes',
  -width=>$entrywidth,
  )->pack(
    -fill=>'both',
    -expand=>1,
    -pady=>$ypad,
    -side=>'left',
    );

$bothcommentlist=$listframe3->Listbox(
  -yscrollcommand=>['set', $scroll3],
  -relief=>'sunken',
  -font=>'8x13bold',
  -highlightthickness=>0,
  -background=>$txtbackground,
  -foreground=>$txtforeground,
  -selectforeground=>$txtforeground,
  -selectbackground=>'#c0d0c0',
  -borderwidth=>1,
  -selectmode=>'extended',
  -setgrid=>'yes',
  -width=>$commentwidth,
  )->pack(
    -fill=>'both',
    -expand=>1,
    -pady=>$ypad,
    -side=>'left'
    );    

#$scroll3->configure(-command=>['yview', $bothdatalist]);
$scroll3->configure(-command=>\&tie_yview);

########################################################
#bottom row of buttons and labels

$buttonframe->Button(
  -text=>'Cancel',
  -borderwidth=>'1',
  -width=>6,
  -background=>$buttonbackground,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -command=>sub{&checkpointit;exit;},
  )->pack(
    -side=>'right',
    -padx=>1,
    -pady=>2,
    );

$buttonframe->Button(
  -text=>'Calculate!',
  -borderwidth=>'1',
  -width=>10,
  -background=>$buttonbackground,
  -foreground=>'red4',
  -highlightthickness=>0,
  -font=>$winfont,
  -command=>sub{&calcit;},
  )->pack(
    -side=>'left',
    -padx=>2,
    -pady=>2,
    );

$buttonframe->Button(
  -text=>'Save',
  -borderwidth=>'1',
  -width=>6,
  -background=>$buttonbackground,
  -foreground=>$txtforeground,
  -highlightthickness=>0,
  -font=>$winfont,
  -command=>sub{&savit;},
  )->pack(
    -side=>'left',
    -padx=>2,
    -pady=>2,
    );

#press enter and perform a calculate
$aincome->bind('<KeyPress-Return>'=>sub{$bincome->focus;&calcsplit;});
$bincome->bind('<KeyPress-Return>'=>sub{$aincome->focus;&calcsplit;});

$apercent->bind('<KeyPress-Return>'=>sub{&genbpercent;});
$bpercent->bind('<KeyPress-Return>'=>sub{&genapercent;});

$aentry->bind('<KeyPress-Return>'=>sub{&calcit;});
$bentry->bind('<KeyPress-Return>'=>sub{&calcit;});
$bothentry->bind('<KeyPress-Return>'=>sub{&calcit;});
$aentrycomment->bind('<KeyPress-Return>'=>sub{&calcit;$aentry->focus});
$bentrycomment->bind('<KeyPress-Return>'=>sub{&calcit;$bentry->focus});
$bothentrycomment->bind('<KeyPress-Return>'=>sub{&calcit;$bothentry->focus});

$adatalist->bind('<Double-1>'=>sub{&poplist("adatalist")});
$bdatalist->bind('<Double-1>'=>sub{&poplist("bdatalist")});
$bothdatalist->bind('<Double-1>'=>sub{&poplist("bothdatalist")});
$acommentlist->bind('<Double-1>'=>sub{&poplist("acommentlist")});
$bcommentlist->bind('<Double-1>'=>sub{&poplist("bcommentlist")});
$bothcommentlist->bind('<Double-1>'=>sub{&poplist("bothcommentlist")});

#populate the form with values from the checkpoint file
foreach $arrayname (@arraylist) {
   foreach (@{$arrayname}) {
      ${$arrayname}->insert('end',$_);
      }  
   }

#calculate the data
&calcit;

MainLoop;

sub tie_ayview { 
  $adatalist->yview(@_);
  $acommentlist->yview(@_); 
  }
  
sub tie_byview { 
  $bdatalist->yview(@_);
  $bcommentlist->yview(@_); 
  }

sub tie_yview { 
  $bothdatalist->yview(@_);
  $bothcommentlist->yview(@_); 
  }

sub savit {
  &calcit;
  $date=`date`;
  open(outfile, ">$outfile") or die "Can't open output file - $outfile";
  print outfile "\nReport created $date";
  print outfile "\n\nA data:";
  print outfile "          Total income: \$$aincomedata";
  print outfile "  Percentage of income: \%$apercentdata\n";
  for ($t=0; $t<=$#adatalist; $t++) {
    $expense=$adatalist[$t];
    $expensecomment=$acommentlist[$t];
    print outfile "       Extra Donations: \$$expense\t$expensecomment";
    }
  if ($#adatalist>-1) {
    print outfile " ";
    }   
  print outfile "                 Total: \$$atotalentry";
  print outfile "    Per Paycheck Total: \$$apaycheckentry";  
  
  print outfile "\n\nB data:";
  print outfile "          Total income: \$$bincomedata";
  print outfile "  Percentage of income: \%$bpercentdata\n";
  
  for ($t=0; $t<=$#bdatalist; $t++) {
    $expense=$bdatalist[$t];
    $expensecomment=$bcommentlist[$t];
    print outfile "       Extra Donations: \$$expense\t$expensecomment";
    }
  if ($#bdatalist>-1) {
    print outfile " ";
    }    
  print outfile "                 Total: \$$btotalentry";
  print outfile "    Per Paycheck Total: \$$bpaycheckentry";
    
  print outfile "\n\nShared data:";
  for ($t=0; $t<=$#bothdatalist; $t++) {
  #foreach (@bothdatalist) {
    $expense=$bothdatalist[$t];
    $expensecomment=$commentdatalist[$t];
    print outfile "       Shared expenses: \$$expense\t$expensecomment";
    }
  print outfile "                 Total: \$$bothtotalentry";    
  close outfile;
  #save the checkpoint file
  &checkpointit
  }#sub savit
  
sub calcsplit {
  if ($aincomedata ne "" && $bincomedata ne "") {
    $apercentdata=sprintf("%4.5f",($aincomedata/($aincomedata+$bincomedata))*100); 
    $bpercentdata=sprintf("%4.5f",($bincomedata/($aincomedata+$bincomedata))*100);
    &calcit; 
    }
    }
sub genapercent {
  if ($bpercentdata ne "") {
    $apercentdata=100-$bpercentdata;
    }
  &calcit;  
  }#sub genapercent


sub genbpercent {    
  if ($apercentdata ne "") {
    $bpercentdata=100-$apercentdata;
    }
  &calcit;     
  }#sub genbpercent
  
sub calcit {  
  if ($aentrydata ne "") {
    $aentrydata=sprintf("%5.2f",($aentrydata));
    $aentrydata=sprintf("%10s",($aentrydata));
    $adatalist->insert(0,$aentrydata);
    $acommentlist->insert(0,$acommentdata);
    $aentrydata="";
    $acommentdata="";
    }

  if ($bentrydata ne "") {
    $bentrydata=sprintf("%5.2f",($bentrydata));
    $bentrydata=sprintf("%10s",($bentrydata));
    $bdatalist->insert(0,$bentrydata);
    $bcommentlist->insert(0,$bcommentdata);
    $bentrydata="";
    $bcommentdata="";
    }
  if ($bothentrydata ne "") {
    $bothentrydata=sprintf("%5.2f",($bothentrydata));
    $bothentrydata=sprintf("%10s",($bothentrydata));
    $bothdatalist->insert(0,$bothentrydata);
    $bothcommentlist->insert(0,$bothentrycommentdata);
    $bothentrydata="";
    $bothentrycommentdata="";
    }
  
  $bothtotalentry="";
  @adatalist=$adatalist->get(0,"end");
  @acommentlist=$acommentlist->get(0,"end");
  
  @bdatalist=$bdatalist->get(0,"end");
  @bcommentlist=$bcommentlist->get(0,"end");
    
  @bothdatalist=$bothdatalist->get(0,"end");
  @bothcommentlist=$bothcommentlist->get(0,"end");
  foreach (@bothdatalist) {
    $bothtotalentry+=$_;
    }
  $bothtotalentry=sprintf("%7.2f",($bothtotalentry));
  $bothtotalentry=sprintf("%10s",($bothtotalentry));
  
  $atotalentry="";
  @adatalist=$adatalist->get(0,"end");
  foreach (@adatalist) {
    $atotalentry+=$_;
    }
  $atotalentry=sprintf("%5.2f",($atotalentry+($bothtotalentry*($apercentdata/100))));
  $atotalentry=sprintf("%10s",($atotalentry));
    
  $btotalentry="";
  @bdatalist=$bdatalist->get(0,"end");
  foreach (@bdatalist) {
    $btotalentry+=$_;
    }
  $btotalentry=sprintf("%5.2f",($btotalentry+($bothtotalentry*($bpercentdata/100))));  
  $btotalentry=sprintf("%10s",($btotalentry));
  
  $apaycheckentry=sprintf("%5.2f",($atotalentry/2));
  $apaycheckentry=sprintf("%10s",($apaycheckentry));
  
  $bpaycheckentry=sprintf("%5.2f",($btotalentry/2)); 
  $bpaycheckentry=sprintf("%10s",($bpaycheckentry));
   
  }

#pop the double clicked process info of of the kill array and listbox
sub poplist {
  ($column)=@_;
  $select=(${$column}->curselection);
  ${$column}->delete($select,$select);
  #if the commentlist is doubleclicked, must remove the data list element too
  if ($column eq "acommentlist") {
    $adatalist->delete($select,$select);
    }
    
  if ($column eq "adatalist") {
    $acommentlist->delete($select,$select);
    }  
  if ($column eq "bcommentlist") {
    $bdatalist->delete($select,$select);
    }
    
  if ($column eq "bdatalist") {
    $bcommentlist->delete($select,$select);
    }  
  
  if ($column eq "bothcommentlist") {
    $bothdatalist->delete($select,$select);
    }
    
  if ($column eq "bothdatalist") {
    $bothcommentlist->delete($select,$select);
    }  
  &calcit;
  }#sub


#save the checkpoint file and exit the program
sub checkpointit {
  #write out the checkpoint file for the next time the utility is started
   open(ckptfile, ">$checkpointfile") or die "Can't open checkpoint file - $checkpointfile"; 
   print ckptfile "\#Checkpoint file for fairsplit.pl utility";
   print ckptfile "\#Data values are saved on exit and restored on startup\n";

   foreach $varname (@variablelist) {
      print ckptfile "\$$varname=${$varname}\;\n";   
      }

   foreach $arrayname (@arraylist) {
      $arraystring="\@$arrayname=\(\n";
      foreach (@{$arrayname}) {
         $arraystring.="\"$_\",\n"
         }
      $arraystring.="\);";  
      print ckptfile "\n$arraystring";    
      }
   print ckptfile "\n1\;";
   close ckptfile;  
   }

#return a positive status 
1;
