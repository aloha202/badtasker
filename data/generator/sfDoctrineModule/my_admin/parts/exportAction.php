    public function executeExport()
    {
        $q = $this->buildQuery();
        $<?php echo $this->getPluralName() ?> = $q->execute();
        $csv = $this->getPartial('list_export', array('results' => $<?php echo $this->getPluralName() ?>, 'delimiter' => sfConfig::get('app_csv_delimiter')));
        <?php if($this->getExportEncoding() != 'utf-8'): ?>
        $csv = iconv('utf-8', '<?php echo $this->getExportEncoding(); ?>', $csv);
        <?php endif; ?>
        $filename = strtr(T::__('<?php echo $this->getExportFilename(); ?>'), array(
            '%date%' => date('<?php echo $this->getExportDateFormat(); ?>')
        )) . '.<?php echo $this->getExportMode(); ?>';        
        <?php if($this->getExportMode() == 'xslx'): ?>
        ProjectHelper::giveXlsFromCsv($csv, $filename);
        <?php else: ?>
        header('Content-Type: text/csv;charset=utf8');
        header('Content-Disposition: attachment; filename="' . $filename . '"');
        header('Content-Length: ' . strlen($csv));
        echo $csv;
        <?php endif; ?>
        die;        
    }