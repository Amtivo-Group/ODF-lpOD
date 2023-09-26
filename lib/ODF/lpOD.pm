#=============================================================================
#
#       Copyright (c) 2010 Ars Aperta, Itaapy, Pierlis, Talend.
#       Copyright (c) 2014 Jean-Marie Gouarné.
#       Author: Jean-Marie Gouarné <jean-marie.gouarne@online.fr>
#
#=============================================================================
use     5.010001;
use     strict;
#=============================================================================
#       The main module for the lpOD Project
#=============================================================================
package ODF::lpOD;

# ABSTRACT:  OpenDocument Management Interface

our $VERSION = '9.99';  # VERSION (overwritten by Dist::Zilla)
our $DATE = 'dev'; # DATE

#use constant PACKAGE_DATE       =>      "2023-04-03T22:39:00";
sub PACKAGE_DATE() { $DATE }

#  These are the overall distribution version number and release date,
#  provided at build time by Dist::Zilla OurPkgVersion and OurDate
#
#  Note: Many other $ VERSION variables and PACKAGE_DATE constants also
#  exist, one for each package in the distribution (e.g. ODF::lpOD::Element,
#  ODF::lpOD::TextNode, etc. etc.) which probably are not up-to-date 
#  (mostly inherited from ODF::lpOD 1.127).

#  FIXME: Is an independent version & date needed for every package?
#
#  Perhaps the packages were once maintained by different people, but now it
#  seems burdensome to maintain them, and pointless to have them at all
#  if they aren't maintained.
#  --> We could eliminate the package-level versions & dates, or replace
#  them with #VERSION and #DATE, to be replaced at build-time with a common
#  distribution version and release date.

use ODF::lpOD::Common;
#-----------------------------------------------------------------------------
use ODF::lpOD::Document;
use ODF::lpOD::TextElement;
use ODF::lpOD::Field;
use ODF::lpOD::StructuredContainer;
use ODF::lpOD::Table;
use ODF::lpOD::Style;
use ODF::lpOD::Attributes;
#-----------------------------------------------------------------------------
use base 'Exporter';
our @EXPORT     = ();
push @EXPORT,   @ODF::lpOD::Common::EXPORT;
#=============================================================================

BEGIN
        {
        my $lpod_pm_path = $INC{'ODF/lpOD.pm'} // "";
        $lpod_pm_path =~ s/\.pm$//;
        $ODF::lpOD::Common::INSTALLATION_PATH = $lpod_pm_path;
        load_color_map;
        }

#=============================================================================
1;
