#include <iostream>
#include "lib/config/struct.h"
#include "3rdparty/parson/parson.h"
#include "3rdparty/logger/logger.h"
#include ""
#include "fota/api.c"
#include "fota/fota.c"
#include "lib/config.c"

#include <gtest/gtest.h>


TEST(inittest,nullvalues){
ASSERT_EQ(-1,init(NULL));


}











int main(int argc, char **argv){


testing::InitGoogleTest(&argc, argv);
return RUN_ALL_TESTS();

}
