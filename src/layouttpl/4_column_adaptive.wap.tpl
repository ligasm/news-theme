<div class="columns-3" id="main-content" role="main">
    <div class="portlet-layout row">
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 portlet-column portlet-column-first" id="column-1">
            $processor.processColumn("column-1", "portlet-column-content portlet-column-content-first")
        </div>

        <div class="col-xs-12 col-sm-3 col-md-4 col-lg-3 portlet-column" id="column-2">
            $processor.processColumn("column-2", "portlet-column-content")
        </div>

        <div class="col-xs-12 col-sm-3 col-md-4 col-lg-3 portlet-column portlet-column-last" id="column-3">
            $processor.processColumn("column-3", "portlet-column-content")
        </div>

        <div class="hidden-xs hidden-sm hidden-md col-lg-3 portlet-column portlet-column-last" id="column-3">
            $processor.processColumn("column-4", "portlet-column-content portlet-column-content-last")
        </div>
    </div>
</div>