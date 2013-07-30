package com.springapp.mvc;

import org.springframework.data.jpa.repository.JpaRepository;
import com.springapp.mvc.syncmodel.*;
/**
 * Created with IntelliJ IDEA.
 * User: kip
 * Date: 7/30/13
 * Time: 12:26 PM
 * To change this template use File | Settings | File Templates.
 */

public interface DatasetRepository  extends JpaRepository<SyncDataSet, Long> {


}
