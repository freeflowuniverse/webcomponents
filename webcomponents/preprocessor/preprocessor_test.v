module preprocessor

import freeflowuniverse.webcomponents
import freeflowuniverse.herolib.core.pathlib
import os

const testdata = '${os.dir(@FILE)}/testdata/content'

pub fn test_preprocess() {
	preprocess(preprocessor.testdata)!
}
